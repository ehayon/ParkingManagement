<?php

ParkingLot::has_many_through(new Comment, 'parkinglots_comments');
