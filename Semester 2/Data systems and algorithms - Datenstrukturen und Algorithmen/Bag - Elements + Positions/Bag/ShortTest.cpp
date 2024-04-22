#include "ShortTest.h"
#include <assert.h>
#include "Bag.h"
#include "BagIterator.h"
#include <iostream>

void testAll() { 
	Bag b;
	assert(b.isEmpty() == true);
	assert(b.size() == 0); 
	b.add(5);
	b.add(1);
	b.add(10);
	b.add(7);
	b.add(1);
	b.add(11);
	b.add(-3);
	assert(b.size() == 7);
	assert(b.search(10) == true);
	assert(b.search(16) == false);
	assert(b.nrOccurrences(1) == 2);
	assert(b.nrOccurrences(7) == 1);
	assert(b.remove(1) == true);
	assert(b.remove(6) == false);
	assert(b.size() == 6);
	assert(b.nrOccurrences(1) == 1);
	BagIterator it = b.iterator();
	it.first();
	while (it.valid()) {
		TElem e = it.getCurrent();
		it.next();
	}
    // removeMaxFreq test
    std::cout<<"Test removeMaxFreq\n";
    Bag b1;
    int maxElem;
    int maxNrOcc = 0;
    assert(b1.removeMaxFreq() == false);
    b1.add(5);
    b1.add(5);
    b1.add(10);
    b1.add(7);
    b1.add(2);
    b1.add(2);
    b1.add(2);
    BagIterator it1 = b1.iterator();
    it1.first();
    while (it1.valid()) {
        if(b1.nrOccurrences(it1.getCurrent()) > maxNrOcc){
            maxNrOcc = b1.nrOccurrences(it1.getCurrent());
            maxElem = it1.getCurrent();
        }
        it1.next();
    }
    assert(b1.removeMaxFreq());
    it1.first();
    while(it1.valid()){
        assert(it1.getCurrent() != maxElem);
        it1.next();
    }
}
