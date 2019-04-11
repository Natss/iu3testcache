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
  
`COMPANYWEB`
- ajax.users
- Company.Users
- Company.Company

# Окончание работы

Не забыть остановить инстанс, а то потом придется перезагружаться

```bash
MacBook:intersystems nats$ ./cstop
```
