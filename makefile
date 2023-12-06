###
### Makefile for Gerp Project
### Gerp is a program that search for given words in a given directory
###
### Authors:  Cullen McCaleb and Frank Li

MAKEFLAGS += -L

CXX      = clang++
CXXFLAGS = -g3 -Wall -Wextra -Wpedantic -Wshadow
LDFLAGS  = -g3 

#main rule
gerp: main.o DirNode.o FSTree.o wordHash.o stringProcessing.o
	$(CXX) $(LDFLAGS) -o gerp main.o DirNode.o FSTree.o wordHash.o stringProcessing.o

#Rule for FSTreeTraversal.o
#FSTreeTraversal.o: FSTreeTraversal.cpp DirNode.h FSTree.h
#	$(CXX) $(CXXFLAGS) -c FSTreeTraversal.cpp

#Rule for wordHash.o
wordHash.o: wordHash.cpp DirNode.h FSTree.h
	$(CXX) $(CXXFLAGS) -c wordHash.cpp

#Rule for stringPrrocessing.o
stringProcessing.o: stringProcessing.cpp
	$(CXX) $(CXXFLAGS) -c stringProcessing.cpp

#Rule for main.o
main.o: main.cpp DirNode.h FSTree.h
	$(CXX) $(CXXFLAGS) -c main.cpp

# The below rule will be used by unit_test.
unit_test: unit_test_driver.o DirNode.o FSTree.o wordHash.o stringProcessing.o
	$(CXX) $(CXXFLAGS) $^


clean:
	@rm -r *~ *# *.o a.out core* vgcore*
