# database.py
# Handles all the methods interacting with the database of the application.
# Students must implement their own methods here to meet the project requirements.

import os
import pymysql.cursors
from prettytable import PrettyTable

db_host = os.environ['DB_HOST']
db_username = os.environ['DB_USER']
db_password = os.environ['DB_PASSWORD']
db_name = os.environ['DB_NAME']


def connect():
    try:
        conn = pymysql.connect(host=db_host,
                               port=3306,
                               user=db_username,
                               password=db_password,
                               db=db_name,
                               charset="utf8mb4", cursorclass=pymysql.cursors.DictCursor)
        print("Bot connected to database {}".format(db_name))
        return conn
    except:
        print("Bot failed to create a connection with your database because your secret environment variables " +
              "(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME) are not set".format(db_name))
        print("\n")

# your code here

def get_response(msg):
  data = msg.split()
  errors = []
  response = None
  command = data[0]
  if "/cheap-hotel" in command: 
      response = businessRuleOne()

  elif "/repeat-customer" in command:
    if len(data) <= 1:
      errors.append("You are missing the hotel name arugment")
    else:
      hotel = data[1]
      response = businessRuleTwo(hotel)
  
  elif "/500-payment" in command:
    response = businessRuleThree()
  
  elif "/300-revenue" in command: 
      response = businessRuleFour()
  
  elif "/100-expenditure" in command:
      response = businessRuleFive()
  
  # elif "/unique-item" in command:
  #   if not data[1]: 
  #     errors.append("You are missing the customer argument")
  #   else: 
  #     customer = data[1]
  #     response = businessRuleSix(customer)
  
  elif "/customer" in command: 
    if len(data) <= 1:
      errors.append("You are missing the year argument ")
    else:
      year = data[1]
      response = businessRuleSeven(year)
    
  # elif "/beverage-buyer" in command:
  #   response = businessRuleEight()

  else:
    errors.append("Command does not exist or was mistyped")  
  
  if len(errors) >= 1:
    return errors
  return response


def businessRuleOne():
  output = None
  rows = []
  headers = ["Hotel", "Cost"]
  conn = connect()
  if conn:
    cursor = conn.cursor()
    query = """SELECT Hotel, ROUND(AVG(WeeklyAverage),2) FinalAverage
    FROM (
    SELECT 
        h.name Hotel, 
        YEAR(p.date) PaymentYear, 
        WEEK(p.date) PaymentWeek, 
        AVG(p.amount) WeeklyAverage
    FROM Hotel h
        JOIN Customer c
            ON c.hotelId = h.hotelId
        JOIN Payment p
            ON p.paymentId = c.paymentId
    GROUP BY 
        h.hotelId, 
        YEAR(p.date), 
        WEEK(p.date)
    ) initial_data
    GROUP BY Hotel
    ORDER BY AVG(WeeklyAverage) 
    LIMIT 1;"""
  cursor.execute(query)
  data = cursor.fetchall()
  
  if data: 
    for hotel_data in data:
      row = []
      hotel = hotel_data['Hotel']
      row.append(hotel)
      average = hotel_data['FinalAverage']
      row.append(average)
      rows.append(row)
  output = format_data(headers, rows)
  conn.close()
  print(output)
  return output

  
      

def businessRuleTwo(hotel):
  output = None
  rows = []
  headers = ["Customer", "Hotel"]
  conn = connect()

  if conn:
    cursor = conn.cursor()
    query = """SELECT Customer.name AS "name" , Hotel.name AS "hotel"
               FROM Customer 
               JOIN Hotel ON Hotel.hotelId = Customer.hotelId
               WHERE Hotel.name = %s
               GROUP BY Customer.name
               HAVING COUNT(*) > 1;"""

    variable = hotel
    cursor.execute(query,variable)
    data = cursor.fetchall()

    if data: 
      for customer_data in data:
        row = []
        customer = customer_data['name']
        row.append(customer)
        hotel = customer_data['hotel']
        row.append(hotel)
        rows.append(row)
    output = format_data(headers,rows)
    conn.close()
    print(output)
    return output


def businessRuleThree():
  output = None
  rows = []
  headers = ["Hotel", "Total"]
  conn = connect()
  
  if conn: 
    cursor = conn.cursor()
    query = """SELECT Hotel.name AS "hotel", Payment.amount AS "total"
               FROM Hotel
               JOIN Customer ON Customer.hotelId = Hotel.hotelId
               JOIN Payment ON Payment.paymentId = Customer.paymentId
               WHERE Payment.amount > 500
            """
  cursor.execute(query)
  data = cursor.fetchall()

  if data:
    for hotel_data in data:
        row = []
        hotel = hotel_data['hotel']
        row.append(hotel)
        total = hotel_data['total']
        row.append(total)
        rows.append(row)
    output = format_data(headers,rows)
    conn.close()
    print(output)
    return output

def businessRuleFour():
  output = None 
  rows = []
  headers = ["Hotel", "Revenue"]
  conn = connect()

  if conn:
    cursor = conn.cursor()
    query = """SELECT  Hotel, ROUND(AVG(WeeklyRevenue),2) AS AVGRevenue
          FROM (
          SELECT 
          Hotel.name AS Hotel, 
            YEAR(Revenue.date) AS RevenueYear,
            WEEK(Revenue.date) AS RevenueWeek,
            AVG(Revenue.total) AS WeeklyRevenue
            FROM Hotel 
            JOIN Revenue ON Revenue.revenueId = Hotel.revenueId
          GROUP BY Hotel.hotelId, YEAR(Revenue.date), WEEK(Revenue.date)
          ) initial_data
          WHERE WeeklyRevenue > 300
          GROUP BY Hotel
          ORDER BY AVG(WeeklyRevenue); 
          """
  cursor.execute(query)
  data = cursor.fetchall()

  if data: 
    for hotel_data in data:
      row = []
      hotel = hotel_data["Hotel"]
      row.append(hotel)
      revenue = hotel_data["AVGRevenue"]
      row.append(revenue)
      rows.append(row)
  output = format_data(headers,rows)
  conn.close()
  print(output)
  return output

def businessRuleFive():
  output = None 
  rows = []
  headers = ["Hotel", "Expenditures"]
  conn = connect()

  if conn:
    cursor = conn.cursor()
    query = """SELECT  Hotel, ROUND(AVG(WeeklyExpenditure),2) AS AVGExpenditure
    FROM (
            SELECT 
          Hotel.name AS Hotel, 
            YEAR(Expenditures.date) AS ExpenditureYear,
            WEEK(Expenditures.date) AS ExpenditureWeek,
            AVG(Expenditures.total) AS WeeklyExpenditure
        FROM Hotel
          JOIN Expenditures ON Expenditures.hotelId = Hotel.hotelId
        GROUP BY Hotel.hotelId, YEAR(Expenditures.date), WEEK(Expenditures.date)
        ) initial_data
        WHERE WeeklyExpenditure > 100
        GROUP BY Hotel
        ORDER BY AVG(WeeklyExpenditure);
        """
  cursor.execute(query)
  data = cursor.fetchall()

  if data:
    for hotel_data in data:
      row = []
      hotel = hotel_data["Hotel"]
      row.append(hotel)
      expenditures = hotel_data["AVGExpenditure"]
      row.append(expenditures)
      rows.append(row)
  output = format_data(headers,rows)
  conn.close()
  print(output)
  return output



def businessRuleSeven(year):
  output = None 
  rows = []
  headers = ['Customer', 'Hotel']
  conn = connect()

  if conn: 
    cursor = conn.cursor()
    query = """SELECT Customer.name AS Customer, Hotel.name AS Hotel
               FROM Customer 
               JOIN Hotel ON Hotel.hotelId = Customer.hotelId
               JOIN Booking ON Booking.bookingId = Customer.bookingId
               WHERE Booking.bookingDate <= %s
               GROUP BY Hotel.name, Customer
               HAVING COUNT(*) > 1; 
            """
    variable = year
    cursor.execute(query,variable)
    data = cursor.fetchall()

    if data: 
      for customer_data in data: 
        row = []
        customer = customer_data['Customer']
        row.append(customer)
        hotel = customer_data['Hotel']
        row.append(hotel)
        rows.append(row)
    output = format_data(headers,rows)
    conn.close()
    print(output)
    return output


def format_data(headers, rows):
  table = PrettyTable()
  table.field_names = headers
  for row in rows:
    table.add_row(row)
  return table