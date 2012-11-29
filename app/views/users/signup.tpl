%%layout:app/views/layout.tpl%%

{css}
<link rel="stylesheet" href="../public/css/users.css" />
{/css}

{title}Signup Page{/title}

{body}
  [flash]

  <div class="container">
    <a class="btn btn-primary" data-toggle="modal" href="#signUpModal">Sign up</a>
  </div>

  <div class="modal hide fade" id="signUpModal">
    <div class="modal-header">
      <button class="close" data-dismiss="modal">x</button>
      <h3>Sign up</h3>
    </div>
    <div class="modal-body">
      <form class="form-signin" method="POST" action="./signup">
        <input type="text" name="username" class="input-block-level" value ="[username]" placeholder="Username">
        <input type="text" name="fname" class="input-block-level" value="[fname]" placeholder="First Name">
        <input type="text" name="lname" class="input-block-level" value="[lname]" placeholder="Last Name">
        <input type="text" name="email" class="input-block-level" value="[email]" placeholder="Email">
        <input type="password" name="password" class="input-block-level" placeholder="Password">
        <input type="password" name="password_confirmation" class="input-block-level" placeholder="Re-type Password">
		<input type="submit" value="Sign Up" class="brn btn-primary" />
      </form>
    </div>
    <div class="modal-footer">
    </div>
  </div>
{/body}

{javascript-includes}
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script src="../public/js/bootstrap.min.js"></script>
{/javascript-includes}
