### Koans

find note with #NOTE

 1. AboutAsserts
 2. AboutTrueAndFalse
 3. AboutStrings
 4. AboutSymbols
 5. AboutArrays
 6. AboutArrayAssignment
 7. AboutObjects
 8. AboutNil
 9. AboutHashes
10. AboutMethods
11. AboutKeywordArguments
12. AboutConstants
13. AboutRegularExpressions
14. AboutControlStatements
15. AboutTriangleProject
16. AboutExceptions
17. AboutTriangleProject2
AboutIteration
AboutBlocks
AboutSandwichCode
AboutScoringProject
AboutClasses
AboutOpenClasses
AboutDiceProject
AboutInheritance **
AboutModules
AboutScope
AboutClassMethods
AboutMessagePassing




entrare in una console ruby
❯ irb
irb(main):001> p "pippo" => "pippo"
irb(main):002> exit
❯ 

class Cat
  attr_reader :color
  def inspect
    "Cat - id: #{object_id} - color: #{color}"
  end
end
Cat.new("white").inspect