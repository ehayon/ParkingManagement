<?php

ParkingLot::has_many_through(new Comment, 'parkinglots_comments');
User::has_one(new Role);
