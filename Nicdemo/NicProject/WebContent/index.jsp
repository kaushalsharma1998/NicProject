<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <title>Home</title>
 
  <script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>

  
  
  
  
  </head>
  
  
  <body>
  <script>
  $(document).ready(function(){
      var $submitBtn = $("#submit");
      var $passwordBox = $("#password");
      var $confirmBox = $("#rpassword");
      var $errorMsg =  $('<span id="error_msg" style="color:red">Passwords do not match.</span>');

      // This is incase the user hits refresh - some browsers will maintain the disabled state of the button.
      $submitBtn.removeAttr("disabled");

      function checkMatchingPasswords(){
          if($confirmBox.val() != "" && $passwordBox.val != ""){
              if( $confirmBox.val() != $passwordBox.val() ){
                  $submitBtn.attr("disabled", "disabled");
                  $errorMsg.insertAfter($confirmBox);
              }
          }
      }

      function resetPasswordError(){
          $submitBtn.removeAttr("disabled");
          var $errorCont = $("#error_msg");
          if($errorCont.length > 0){
              $errorCont.remove();
          }  
      }


      $("#rpassword, #password")
           .on("keydown", function(e){
              /* only check when the tab or enter keys are pressed
               * to prevent the method from being called needlessly  */
              if(e.keyCode == 13 || e.keyCode == 9) {
                  checkMatchingPasswords();
              }
           })
           .on("blur", function(){                    
              // also check when the element looses focus (clicks somewhere else)
              checkMatchingPasswords();
          })
          .on("focus", function(){
              // reset the error message when they go to make a change
              resetPasswordError();
          })

  });
  
  
</script>
  
  
  <%@ include file="nav-bar.jsp" %>
  <div class="container h-100 "  style="margin-top:50px;">
    <div class="row  justify-content-center align-items-center">
        <div class="col-10 col-md-8 col-lg-6">
  <form name="form" action="registration.jsp" method="post">
  <h1>Register Here</h1>
  <div class="row" style="margin-top:10px;">
    
    <div class="col form-group">
    <label for="firstname">First Name </label>
      <input type="text" name="firstname" class="form-control" placeholder="First name" required="required">
    </div>
    <div class="col form-group">
      <label for="lastname">Last  Name </label>
      <input type="text"  name="lastname" class="form-control" placeholder="Last name" required="required">
    </div>
  </div>
  <label class="form-check-label">Gender</label>
  <div class="row"style="margin:auto">
  <div class="col form-check">
  <input class="form-check-input"  type="radio" name="gender" id="genderm" value="Male" checked required="required">
  <label class="form-check-label" for="genderm">
    Male
  </label>
</div>
<div class=" col form-check">
  <input class="form-check-input" type="radio" name="gender" id="genderf" value="Female" required="required">
  <label class="form-check-label" for="genderf">
    Female
  </label>
</div>
<div class=" col form-check">
  <input class="form-check-input" type="radio" name="gender" id="gendero" value="Other" required="required">
  <label class="form-check-label" for="other">
    Other
  </label>
</div>
</div>
<br>
  <div class="form-group">
    <label for="address">Address</label>
    <input type="text" class="form-control"  name="address" id="address" placeholder="Address" required="required">
  </div>
<div class="form-group">
    <label for="age">Age</label>
    <input type="number" class="form-control" name="age" id="age" placeholder="Age" required="required">
  </div>



  
  <div class="form-group">
    <label for="email">Email address</label>
    <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="Enter email" required="required">
   <!--  <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
  </div>
  <div class="form-group">
    <label for="password">Password</label>
    <input type="password" class="form-control"  name="password"  id="password" placeholder="Password" required="required">
  </div>
  <div class="form-group">
    <label for="rpassword"> Retype Password</label>
    <input type="password"  name="rpassword" class="form-control" id="rpassword" placeholder="Password" required="required">
  </div>
 <!--  <div class="form-check">
    <input type="checkbox" class="form-check-input" id="rememberme">
    <label class="form-check-label" for="rememberme">Remember me </label>
  </div> --><br>
  
  <button type="submit"  name="submit" id="submit" class="btn btn-primary btn-customized">Submit</button>
   <button type="reset" class="btn btn-primary btn-customized">Reset </button>
</form>
</div>
  </div>
  </div>



















    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>