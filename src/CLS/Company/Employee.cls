Class Company.Employee Extends Company.Users
{

Property department As %String;

Index department On department;

Property salary As %Integer;

Property workfrom As %Date;

Index workfrom On workfrom;

Storage Default
{
<Data name="EmployeeDefaultData">
<Subscript>"Employee"</Subscript>
<Value name="1">
<Value>department</Value>
</Value>
<Value name="2">
<Value>salary</Value>
</Value>
<Value name="3">
<Value>workfrom</Value>
</Value>
</Data>
<DefaultData>EmployeeDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
