%%layout:app/views/layout.tpl%%

{css}
	<link  rel="stylesheet" href="../public/css/main.css" />
{/css}

{title}Park Smart{/title}
{top_right}
	<div class="span5">
		<div class="row">
			<form method="POST" action="">
				<div class="span2">
					<label>Email</label>
					<input type="text">
					<label class="checkbox">
						<input type="checkbox"> Keep me logged in
					</label>
				</div>

				<div class="span2">
					<label>Password</label>
					<input type="password">
					<span class="help-block"><a href="#">Forgot your password?</a></span>
				</div>

				<div class="span1">
					<label>&nbsp;</label>
					<input type="submit" value="Log In" class="btn" style="margin-top: 0;">
				</div>
			</form>
		</div>
	</div>
{/top_right}

{body}
	<div class="container">
		<div class="row">
			<div class="span7">
				<h3>Has this ever happened to you?</h3>
				<ul>
					<li>There is more than one parking lot where you can park your car</li>
					<li>You drive to one of them thinking you will find an available parking spot there</li>
					<li>And, of course, there isn't one. So, you drive to one of the other parking lots... </li>
					<li>Only to find that it is also full!</li>
				</ul>
				<br />
				<h3>Quit driving around and getting frustrated</h3>
				<p>We can tell you exactly where to find a parking spot so you can always Park Smart</p>
			</div>
			<div class="span5">
				<h3>Sign up</h3>
				<form id="sign-up-form" method="POST" action="./signup">
				  <label>Username</label>
				  <input type="text" name="username" class="input-block-level" value="[username]" />

				  <label>First Name</label>
				  <input type="text" name="fname"	class="input-block-level" value="[fname]" />

				  <label>Last Name</label>	
				  <input type="text" name="lname" class="input-block-level" value="[lname]" />

				  <label>Email</label>
				  <input type="text" name="email" class="input-block-level" value="[email]" />

				  <label>Password</label>
				  <input type="password" name="password" class="input-block-level" />

				  <label>Re-enter password</label>
				  <input type="password" name="password_confirmation" class="input-block-level" />
				  <br />
				  <input type="submit" value="Sign Up" class="btn btn-success" style="margin-top: 0;">
			  </form>
			</div>
		  </div>
		  <hr>
	  </div>
{/body}

{javascript-includes}
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script src="../public/js/bootstrap.min.js"></script>
{/javascript-includes}
