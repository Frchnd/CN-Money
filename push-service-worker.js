self.addEventListener('push',event=>{
  let data={};
  try{data=event.data?event.data.json():{}}catch{data={body:event.data?.text()||''}}
  const title=data.title||'CN MONEY';
  const options={
    body:data.body||'Ada aktivitas baru.',
    tag:data.tag||'cn-money-household',
    renotify:false,
    data:{url:data.url||'/'},
    silent:false
  };
  event.waitUntil(self.registration.showNotification(title,options));
});
self.addEventListener('notificationclick',event=>{
  event.notification.close();
  const target=new URL(event.notification.data?.url||'/',self.location.origin).href;
  event.waitUntil(clients.matchAll({type:'window',includeUncontrolled:true}).then(list=>{
    for(const client of list){
      if(client.url.startsWith(self.location.origin)&&'focus'in client){
        if('navigate'in client)client.navigate(target);
        return client.focus();
      }
    }
    return clients.openWindow?clients.openWindow(target):undefined;
  }));
});
