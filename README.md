# Как запускать

- Запустить инстанс 
    ```bash
    MacBook:~ nats$ cd intersystems/
    MacBook:intersystems nats$ ./cstart
    ```
- Рабочий workspace лежит в `~/Documents/12s/prdb.code-workspace`
- Чтобы в `VS Code` узнать допустимые для расширения команды нажать ⌘ + ⇧ + P и начать писать `ObjectScript`
- Чтобы скомпилировать файл (класс) и отправить на сервер нажать ⌘ + F7
- Открыть Caché консоль можно после запуска инстанса `csession ENSEMBLE1`

# Браузерные адреса

- [homepage](http://127.0.0.1:57772/csp/sys/%25CSP.Portal.Home.zen?$NAMESPACE=USER&)
- [errors](http://127.0.0.1:57772/csp/sys/op/UtilSysAppErrors.csp?$ID1=USER&$ID2=03/14/2019&$NAMESPACE=USER)
- [create user](http://127.0.0.1:57772/csp/user/web.createuser.cls)

# Namespaces

Переключить `namespace` можно в настройках расширения

`USER`
- web.createuser
- Company.Users
- Company.Company
- Company.Employee
  
`COMPANYWEB`
- ajax.users
- Company.Users
- Company.Company
- Company.Employee

# Где лежит `js`

Путь можно посмотреть в визуальном [интерфейсе](http://127.0.0.1:57772/csp/sys/sec/%25CSP.UI.Portal.Applications.Web.zen?PID=%2Fcsp%2Fuser) в поле `Физический путь к CSP-файлам` 

У меня лежит в `/Users/nats/intersystems/csp/user/js`

```javascript
function sendRequest(request_str, callback, url, method = 'POST') {
  if (typeof request_str === 'object')
    request_str = JSON.stringify(request_str);
  var xhr = new window.XMLHttpRequest();
  xhr.open(method, url);
  xhr.setRequestHeader('Content-Type', 'application/json');
  xhr.onload = function () {
    if (xhr.status !== 200)
      window.alert('Request failed.  Returned status of ' + xhr.status);
    else if (callback){
		let response_obj = JSON.parse(xhr.responseText);
		callback(response_obj);
	}
  };
  xhr.send(request_str);
}

function request(){
	let username = document.getElementById('username').value;
	let requestData = {username: username};
	sendRequest(requestData, parseResponse, '/csp/companyweb/ajax.users.cls');
}

function parseResponse(response){
	let usersTable = document.getElementById('usersTable');
	usersTable.innerHTML = '';
	let innerHtml = '';
	response.forEach(userdata => {
		innerHtml += `<tr>
			<td>${userdata.id}</td>
			<td>${userdata.name}</td>
			<td>${userdata.age}</td>
			<td>${userdata.companyname}</td>
			</tr>`;
	});
	usersTable.innerHTML = innerHtml;
}
```

# Окончание работы

Не забыть остановить инстанс, а то потом придется перезагружаться

```bash
MacBook:intersystems nats$ ./cstop
```
