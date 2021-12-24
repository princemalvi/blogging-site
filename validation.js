function readURL(input) {
  if (input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
          $('#profileimage')
              .attr('src', e.target.result)
              .width(150)
              .height(150);
      };

      reader.readAsDataURL(input.files[0]);
  }

}

function validateEmail(){
    var email = document.loginform.email.value;
    var span_email = document.getElementById("span_email");
    if(String(email).trim() == "" || email == "")
    {
      span_email.innerHTML = "*Please Enter the Email*";
      return false;
    }else{
      span_email.innerHTML = "";
      return true;
    }    
}


function validatePassword(){
  var password = document.loginform.password.value;   
  var span_password = document.getElementById("span_password");
  if(String(password).trim() == "" || password == "")
  {
    span_password.innerHTML = "*Please Enter the Password*";
    return false;
  }else{
      if(password.length < 8){
          span_password.innerHTML = "*Password  must 8 digit or more*";
          return false;
      }
    }   
    return true;
}


function validateUsername(){
  var username = document.loginform.username.value;   
  var span_username = document.getElementById("span_username");
  if(String(username).trim() == "" || username == "")
  {
    span_username.innerHTML = "*Please Enter the Username*";
    return false;
  }else{
    span_username.innerHTML = "";
    return true;    
  }   
}

function validateFields(){
    if(!validateEmail()){
        return false;
    }
    if(!validatePassword()){
        return false;
    }
    return true;
}


function validateRegFields(){
  if(!validateUsername()){
    return false;
  }
  if(!validateEmail()){
    return false;
  }
  if(!validatePassword()){
    return false;
  }
  return true;
}




// $(document).ready(function () {

//   $('.first-button').on('click', function () {

//     $('.animated-icon1').toggleClass('open');
//   });
//   $('.second-button').on('click', function () {

//     $('.animated-icon2').toggleClass('open');
//   });
//   $('.third-button').on('click', function () {

//     $('.animated-icon3').toggleClass('open');
//   });
// });