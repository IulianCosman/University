#include <exception>
#include "BagIterator.h"
#include "Bag.h"

using namespace std;


BagIterator::BagIterator(const Bag& c): bag(c)
{
	this->index = 0;
    // theta(1)
}

void BagIterator::first() {
    this->index = 0;
    // theta(1)
}


void BagIterator::next() {
	if(this->index < this->bag.nrPos){
        this->index++;
    }
    else{
        throw exception();
    }
    // theta(1)
}


bool BagIterator::valid() const {
	if(this->index < this->bag.nrPos){
        return true;
    }
    return false;
    // theta(1)
}



TElem BagIterator::getCurrent() const
{
    if(valid()) {
        return this->bag.elems[this->bag.pos[index]];
    }
    else{
        throw exception();
    }
    // theta(1)
}
