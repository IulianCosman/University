#include "SetIterator.h"
#include "Set.h"
#include <exception>

using namespace std;

SetIterator::SetIterator(const Set& m) : set(m){
    this->index = 0;
    //initializing the index of the dynamic array with 0
    //complexity-> theta(1) (1 operation)

}


void SetIterator::first() {
    this->index=0;
    //making the index 0, because the first element has the index 0
    //complexity-> theta(1) (1 operation)
}


void SetIterator::next() {
    if(this->index < this->set.nrElems){
        this->index++;
    }
    else{
        throw exception();
    }
    //if the set fits within the restrictions I increase the index, otherwise I raise an exception
    //complexity-> theta(1) (1 operation)
}


TElem SetIterator::getCurrent(){
    if(valid()) {
        return this->set.set_array[this->index];
    }
    else{
        throw exception();
    }
    //if the array is valid I return the current position
    //otherwise I raise an exception
    //complexity-> theta(1) (1 operation)
}

bool SetIterator::valid() const {
    if (this->index >= 0 && this->index < this->set.nrElems)
        return true;
    return false;
    //the array is valid when the index fits within the restrictions (it is lower than the number of possible elements)
    //and when it is not empty (the index is different from 0)
    //complexity-> theta(1) (1 operation)
}



