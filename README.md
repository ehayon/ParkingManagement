##Parking Management System
###For CS546 - Web Development

Ethan Hayon
Carlos Csiszer
Roy Bahian


##Instructions

* DB Dump is located at db/ParkingManagementSystem.sql
* Database credentials are in the bootstrapper: app.php on line 39
* You can log in with my account: username: ethanhayon, password: test
* The only functioning parkinglot is "Hayden Parkinglot" - should be the
  first item in the dropdown list on the dashboard
* To access the site:
  http://localhost/cs546/ParkingManagement/index.php/index
	* remember to use index.php/<route>
	* index.php brings everything together

---

* We wrote an Object Relational Mapper (ORM) as well as a templating
  engine (which supports recursive templates - layouts, can have
layouts, which can have layouts, etc...)
	* Templating engine can be found publicly here:
	  https://github.com/ehayon/PHP_Templating
	* ORM can be found here: https://github.com/ehayon/PHP_ORM
	* The entire source code for the repo is also hosted on github (it's
	  private) - let me know if you want access, I can add you to the
repo.

---

* Follows the MVC style
	* Controllers are located in app/controllers
	* Models in app/models
	* bootstrapper: app.php
	* Routes are defined in the bootstrapper


