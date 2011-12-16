function checkpass(form){  
  object = form["user[role]"];
  if (object.value == 'teacher'){
    password = prompt("enter teacher password please", "pass");
    if (password == 'mixas'){
      alert("password true, you will registrated under teacher account");
      return true;
    }
    else
    {
      alert("password wrong!");
      return false;
    }
  }
}
