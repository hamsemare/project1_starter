# Paths to files
# source files
SRCDIR=src
# objects files
ODIR=obj
# headers
IDIR=include
# executable binaries
BINDIR=bin
# test cases
TESTDIR=./test
#SQLite source
SQLITE=../sqlite

# gcc configuration
CC = gcc
CFLAGS = -I./$(IDIR) -I../$(SQLITE)
LIBS = -lm

.PHONY: directories clean

all : build

# CMPUT391 specific
MAIN_FILE=solution

# Files we need for this question
_OBJ = $(MAIN_FILE).o
OBJ = $(patsubst %.o,$(ODIR)/%.o,$(_OBJ))

# test files
TESTS = t1.txt

# main compilation rule
$(ODIR)/%.o: $(SRCDIR)/%.c $(IDIR)/%.h
	@echo "compiling: $(CC) -c -o $@ $<  $(SQLITE)/sqlite3.c $(CFLAGS)" 
	$(CC) -c -o $@ $< $(CFLAGS)

tasks = build test 

directories : ${ODIR} ${BINDIR}

${ODIR}:
	mkdir -p $(ODIR)

${BINDIR}:
	mkdir -p $(BINDIR)


build: directories $(OBJ)
	@echo "\nBuilding ... "
	$(CC) -o $(BINDIR)/$(MAIN_FILE).out $(OBJ) $(CFLAGS) $(LIBS)

test: build
	@echo "\nTesting ... "
	@for test in `find ${TESTDIR} -name 'test*.py'`; do \
		python $$test ; \
	done

clean:
	@echo "Removing object/binary files: rm -f $(ODIR)/*.o *~ core $(BINDIR)/$(MAIN_FILE).out"
	rm -f $(ODIR)/*.o *~ core $(BINDIR)/$(MAIN_FILE).out
	@echo "Removing output of tests: rm -f $(TESTDIR)/*output.txt"
	rm -f $(TESTDIR)/*output.txt
	@echo "Removing bin and obj directories"
	rm -rf ${ODIR} ${BINDIR}
