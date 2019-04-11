Class ajax.users Extends %CSP.Page
{

ClassMethod OnPage() As %Status
{
    set json = {}.%FromJSON(%request.Content)
    set data = ..getUsers(json.username)    
    write data.%ToJSON()
    Quit $$$OK
}

ClassMethod getUsers(username As %String = "") As %String
{
    set data = []
    &sql(
        DECLARE MyCursor CURSOR FOR
        SELECT top 10 id, name, age, sex, company->name 
        INTO :id, :name, :age, :sex, :companyname
        FROM Company.Users
        WHERE name %STARTSWITH :username
        )
        //вариант в массив INTO :singleUserData()
        &sql(OPEN MyCursor)
        
    FOR { 
            &sql(FETCH MyCursor)
        if (SQLCODE) quit
        
        set user = {
            "id": (id), 
            "name": (name), 
            "age": (age), 
            "companyname": (companyname),
            "sex": (sex)
        }
    
        do data.%Push(user)
        }
        &sql(CLOSE MyCursor)
        
        
        quit data
}

}
