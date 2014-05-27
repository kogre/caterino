Caterino
=========

## Introduction

This project is a no-nonsense Ruby on Rails web application to manage orders and bills in a catering context. It was specifically written to be used as a point of sale system at one time events. It support most functionality needed for these type of events and lacks more advanced features required by restaurants, thereby making it fast, light and easy.

The system is suited for a workflow where orders are taken on paper by waiters. These order notes, as they are called in the system, should pass by the person operating caterino. When a customer leaves, the operator can print the bill for the specific customer.


## Features

The system supports the following entities, fully configurable through the user interface.

* Products, groupeable in product groups
* Halls, containing tables in a graphical top down representation
* Customers
* Order notes
* Payments

* Order notes can be entered efficiently by using the keyboard, supporting 3 entry systems (all in one page)
  * Using the mouse, by simply clicking a product to add one
  * Using the keyboard, by assigning hotkeys to products. Pressing the hotkey adds one.
  * Using the keboard by assigning product id's to the products. This allows for quick no-look entry when the product id codes are included on the physical order notes
* Everything is configurable through the UI.
* Clear and clean bills can be generated and printed using a standard printer.
* The graphical representation of a hall is color coded to indicate the availability of the tables. By grouping the products by their course, colors can be specified to indicate the current course of the customer.
* Statistics
  * Sales
  * Number of customers
  * Number of orders
  * Average sales per customer
  * Average orders per customer
  * Amount sold by product (graphical)
  * Sales by product (graphical)
  * Sales by product group (graphical)
  * Orders by time (graphical)
