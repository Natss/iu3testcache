Class ajax.users Extends %CSP.Page
{

ClassMethod OnPage() As %Status
{

    set data = ..getUsers()    
    write data.%ToJSON()
    Quit $$$OK
}

ClassMethod getUsers() As %String
{
    set data = []
    &sql(
        DECLARE MyCursor CURSOR FOR
        SELECT top 20 id, name, age, sex, company->name 
        INTO :id, :name, :age, :sex, :companyname
        FROM Company.Users
        WHERE id > 20
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
