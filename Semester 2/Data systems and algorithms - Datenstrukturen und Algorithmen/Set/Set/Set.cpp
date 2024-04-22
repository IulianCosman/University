#include "Set.h"
#include "SetITerator.h"

Set::Set() {
    this->nrElems = 0;
    this->cap = 100;
    this->set_array = new TElem[this->cap];
    //constructor
}

void Set::resize(){
    if (this->nrElems <= this->cap / 4) {
        this->cap = this->cap / 2;
        auto *temporary= new TElem[this->cap];
        for (int i = 0; i < this->nrElems; i++) {
            temporary[i] = this->set_array[i];
        }
        delete[] set_array;
        set_array = temporary;
    } //resize down

    if (this->nrElems == this->cap) {
        this->cap = this->cap * 2;
        auto *temporary= new TElem[this->cap];
        for (int i = 0; i < this->nrElems; i++) {
            temporary[i] = this->set_array[i];
        }
        delete[] this->set_array;
        this->set_array = temporary;
    } //resize up

    //resize up-> if the number of elements is equal to the capacity, we double the capacity using a temporary array
    //resize down-> if the number of elements is less than a quarter the capacity, we halve the capacity by using a temporary array
}

bool Set::add(TElem elem) {
    if(search(elem))
        return false; // the element already exists

    this->set_array[this->nrElems] = elem;
    this->nrElems++;

    resize();

    return true;
    //if the element exists we return false, otherwise we add it and return true
}


bool Set::remove(TElem elem) {
	if(!search(elem))
        return false; //the element does not exist

    for (int i = 0; i < this->nrElems; i++) {
        if (this->set_array[i] == elem) {
            for (int j = i; j < this->nrElems; j++) {
                this->set_array[j] = this->set_array[j+1];
            }
            this->nrElems--;
            break;
        }
    }

    resize();

    return true;
    //if the element exists in the set it is removed returning true, otherwise returns false
}

bool Set::search(TElem elem) const {
    for (int i = 0; i < this->nrElems; i++)
        if (this->set_array[i] == elem)
            return true;
    return false;
    //complexity-> theta(1) (best case)
    //complexity-> theta(nrElems) (worst case)
}


int Set::size() const {
    return this->nrElems;
    //complexity-> theta(1)
}


bool Set::isEmpty() const {
    if(this->nrElems == 0) {
        return true;
    }
	return false;
    //complexity-> theta(1)
}


Set::~Set() {
    delete[] this->set_array;
    //destructor
    //complexity-> theta(1) (1 operation)
}

bool Set::equal(Set &other){
    if(this->nrElems != other.nrElems || this->cap != other.cap)
        return false; //the sets have a different amount of elements or different capacities, so they are not equal

    int found=0; //variable in which we store the number of elements from the first set that appear in the second set

    for(int i=0;i<this->nrElems;i++)
        for(int j=0;j<other.nrElems;j++)
            if(this->set_array[i] == other.set_array[j]) {
                found++;
                break;
            }

    if(found == this->nrElems)
        return true;
    return false;

    //check if the two sets have the same amount of elements and the same capacity, otherwise return false
    //check if every element found in the first set is found in the other one, if that is the case we return true, else false
    //complexity-> O(nrElems^2)
}

SetIterator Set::iterator() const {
	return SetIterator(*this);
}


