<?php

ParkingLot::has_many_through(new Comment, 'parkinglots_comments');
ParkingLot::has_many_through(new ParkingSpace, 'parkinglots_parkingspaces');
User::has_one(new Role);
// remember to add announcements!!!
