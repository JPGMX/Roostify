# README
Roostify Take home assignment

By Juan Pablo Gonzalez

* Ruby version : 2.7.2
* Rails Version: 6.1.1


# Question - Bracketed Tax Engine:
Write a program that calculates income tax based on the following rules: - The portion of the income that is less than $10k is untaxed
- The portion of the income that is less than $20k is taxed at 10%
- The portion of the income that is less than $50k is taxed at 20%
- Any portion of the income that is above $50k is taxed at 30%
1. Assume this application will be used by a 3rd party tax consultant who will have to run this for 100 clients.
Write a program that is scalable.
A. I added a Import file form so that the tax consultant can import it's clients in a CSV format (see attached in docs)

The program should take the $ income and return the tax amount.
2. Imagine there are actually 50+ brackets that change every year, and we need to compute 1 Billion income tax projections every year.
Describe in a few bullet points how you’d build a solution that scales.
  *Still since the brackets change every year I believe that the load won't be as much however I would add a module for Tax Brackets (CRUD)
  *Would consider spinning a AWS vm, changing DB's
  * Ruby Threds not efective as C++ Threads but would consider.