const CACHE='cn-money-v2.2.0-shell';
const CORE=[
  '/',
  '/index.html',
  '/manifest.json',
  '/icons/icon-192.png',
  '/icons/icon-512.png',
  '/sounds/shop-click-v04g.wav',
  '/sounds/cash-register-v04f.wav'
];

self.addEventListener('install',event=>{
  event.waitUntil(
    caches.open(CACHE)
      .then(cache=>cache.addAll(CORE))
      .then(()=>self.skipWaiting())
  );
});

self.addEventListener('activate',event=>{
  event.waitUntil(
    caches.keys()
      .then(keys=>Promise.all(
        keys
          .filter(key=>key!==CACHE && key.startsWith('cn-money'))
          .map(key=>caches.delete(key))
      ))
      .then(()=>self.clients.claim())
  );
});

async function networkFirst(request,fallback='/index.html'){
  const cache=await caches.open(CACHE);
  try{
    const response=await fetch(request,{cache:'no-store'});
    if(response && response.ok) cache.put(request,response.clone()).catch(()=>{});
    return response;
  }catch{
    return (await cache.match(request)) ||
      (fallback ? await cache.match(fallback) : undefined) ||
      Response.error();
  }
}

async function staticFirst(request){
  const cache=await caches.open(CACHE);
  const cached=await cache.match(request);
  const update=fetch(request,{cache:'no-store'})
    .then(response=>{
      if(response && response.ok) cache.put(request,response.clone()).catch(()=>{});
      return response;
    })
    .catch(()=>null);
  return cached || await update || Response.error();
}

self.addEventListener('fetch',event=>{
  const request=event.request;
  if(request.method!=='GET') return;

  const url=new URL(request.url);

  if(url.origin===self.location.origin && url.pathname==='/recovery.html') return;

  // Never cache/intercept application data from Supabase or other remote APIs.
  if(url.origin!==self.location.origin){
    // The public Supabase JS library may use the runtime cache after a successful load.
    if(url.hostname==='cdn.jsdelivr.net' && url.pathname.includes('@supabase/supabase-js')){
      event.respondWith(networkFirst(request,null));
    }
    return;
  }

  if(request.mode==='navigate'){
    event.respondWith(networkFirst(request,'/index.html'));
    return;
  }

  const staticPath=
    url.pathname==='/index.html' ||
    url.pathname==='/manifest.json' ||
    url.pathname.startsWith('/icons/') ||
    url.pathname.startsWith('/sounds/');

  if(staticPath) event.respondWith(staticFirst(request));
});
