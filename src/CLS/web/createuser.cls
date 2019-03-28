Class web.createuser Extends %CSP.Page
{

ClassMethod OnPage() As %Status
{
	write "<html>"
	do ..displayHeader()
	do ..displayBody()
	
	write "</html>"

	Quit $$$OK
}

ClassMethod displayHeader()
{
	&HTML<
		<head>
			<title>Тестирование веб приложений в среде Intersystems Cache</title>
			<link rel="shortcut icon" type="image/x-icon" href="https://s3.amazonaws.com/thinkific-import/162126/G3YCO419QT21mxUPL3Yw_favicon.png" />
			<meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
			<link href='css/bootstrap.min.css' rel='stylesheet' type='text/css'>
			<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
			<style>
				BODY {margin: 20px}
			</style>
		</head>
	>
}

ClassMethod displayBody()
{
	&html<
		<body>
		<div class="container">
		<div class="row">
	>
	do ..displayForm()
 	
 	do ..displayUsers()
 	
 	&html<
 		</div>
 		</div>
 		</body>
 	>
}

ClassMethod checkSaveFormData()
{
 	set fromfield = %request.Get("fromfield")
 	if (fromfield){
		//write ..createUserObject()
		set result = ..saveAsInsert()
		if (result){
			&html<
				<div class="alert alert-success" role="alert">
				Сохранено успешно
				</div>
			>
		}
		else{
			&html<
				<div class="alert alert-danger" role="alert">
				#(result)#
				</div>
			>
			
		}
 	}
}

ClassMethod createUserObject()
{
	set result = ..saveObject()
	if (result) {
		set createResult = "ОК"
	}
	else {
		set createResult = ##class(%SYSTEM.Status).GetErrorText(result)
	}
	return createResult
}

ClassMethod displayUsers()
{
	set userObj = ##class(Company.Users).%New()
	do userObj.getUsers(.users)
	do ..displayUsersHtml(.users)
}

ClassMethod displayUsersHtml(users)
{
	&HTML<
		<div class="col-8">
		<div class="card" style="width: auto;">
		<div class="card-header">Users</div>
		<div class="card-body">
		<table border=1 cellpadding=7 cellspacing=7>
		<thead>
			<th>ID</th>
			<th>Name</th>
			<th>Age</th>
			<th>Company</th>
		</thead>
		<div class="col-2">
	>
	
	set userId = ""
	set userdata = ""
	do {
		write "<tr>"
		set userId=$Order(users(userId), 1, userdata) 
		if (userId){
			write "<td>"_$List(userdata,1)_"</td>"
			write "<td>"_$List(userdata,2)_"</td>"
			write "<td>"_$List(userdata,3)_"</td>"
			write "<td>"_$List(userdata,4)_"</td>"
			write "</tr>"
		}
	} while userId
	
	&HTML<
		</table>
		</div>
		</div>
		</div>
		

	>
}

ClassMethod saveObject()
{
 set name = %request.Get("nameField")
 set sex = %request.Get("sexField")
 set age = %request.Get("ageField")

 set userObject = ##class(Company.Users).%New()
 set result = userObject.createUser(name, age, sex)
 return result
}

ClassMethod saveAsInsert()
{
	 set name = %request.Get("nameField")
	 set sex = %request.Get("sexField")
	 set age = %request.Get("ageField")
	 
	 &sql(insert into Company.Users (name, age, sex) 
	 	VALUES (:name, :age, :sex))
	 
	 if (%ROWCOUNT = 0) {
		 set result = %msg
	 }
	 else {
		 set result = 1
	 }
	 return result
}

ClassMethod displayForm()
{
	&html<
	<div class="col-4">
	<div class="card" style="width: 18rem;">
	<div class="card-header">Create user</div>
	<div class="card-body">
	
	<form METHOD="POST">
		<input type="hidden" name="fromfield" value="1" />
		
		<div class="form-group">
			<label for="nameField">User name</label>
			<input type="text" name="nameField" id="nameField" class="form-control" placeholder="User name" >
		</div>
		
		<div class="form-group">
			<label for="ageField">User age
			</label><input type="text" name="ageField" class="form-control">
		</div>
		
		<div class="form-group">
			<label for="sexField">User sex</label>
			<select name="sexField" class="form-control">
				<option value="1">Unknown</option>
				<option value="2">Known but secret</option>
			</select>
		</div>
		
		<button type="submit" class="btn btn-primary">Сохранить</button>
	</form>
	>
	do ..checkSaveFormData()
	&html<
	</div>
	</div>
	</div>
	>
}

}
