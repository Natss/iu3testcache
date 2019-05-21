Class web.vktest Extends %RegisteredObject
{

ClassMethod testRequest(token As %String) As %Boolean
{
    set url = "/method/friends.getOnline?v=5.52&access_token="_token
    set httprequest=##class(%Net.HttpRequest).%New()
    set httprequest.SSLConfiguration="MySSLConfiguration"
    set httprequest.Https=1
    set httprequest.Server="api.vk.com"
    set httprequest.Port=443
    //Do httprequest.InsertFormData("portalid","2000000")
    set tSc = httprequest.Post(url)
    Do httprequest.HttpResponse.OutputToDevice()
    QUIT $$$OK
}

ClassMethod getToken() As %Boolean
{
    set appId = "6951247"
    set accessKey = "1e5b5aec1e5b5aec1e5b5aec6f1e314ba311e5b1e5b5aec42e3f13e707731a4b48a9206"
    set tokenRequest = "https://oauth.vk.com/authorize?client_id="_appId_"&display=page&redirect_uri=https://oauth.vk.com/blank.html&scope=friends&response_type=token&v=5.52"
    set token = "8c68b2ba4dc976ec58f6f955f0346c8c609089bb0efd5fabd9d51caaa04e90363cbd9a97c0cdb40aa266a"
    do ##class(web.vktest).%New().testRequest()
}

ClassMethod requestPost(owner As %Integer) As %Status
{
    set ownerId = -86529522
    set accessToken = "1e5b5aec1e5b5aec1e5b5aec6f1e314ba311e5b1e5b5aec42e3f13e707731a4b48a9206"
    set url = " /method/wall.get?owner_id="_ownerId_"&count=1&filter=owner&extended=1&v=5.95&access_token="_accessToken

    set httprequest=##class(%Net.HttpRequest).%New()
    set httprequest.SSLConfiguration="MySSLConfiguration"
    set httprequest.Https=1
    set httprequest.Server="api.vk.com"
    set httprequest.Port=443
    //Do httprequest.InsertFormData("portalid","2000000")
    set tSc = httprequest.Post(url)
    Do httprequest.HttpResponse.OutputToDevice()
    QUIT $$$OK
}

}
