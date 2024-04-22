#include "Bag.h"
#include "BagIterator.h"
#include <exception>
#include <iostream>
using namespace std;


Bag::Bag() {
    this->nrElems = 0;
    this->nrPos = 0;
    this->capPos = 1;
    this->capElems = 1;
    this->elems = new TElem[this->capElems];
    this->pos = new TElem[this->capPos];
    // theta(6)
}

void Bag::resize(bool resizeType, bool arrayType) {
    if (resizeType == 0 && arrayType == 0) {
        this->capElems = this->capElems / 2;
    } else if (resizeType == 0 && arrayType == 1) {
        this->capPos = this->capPos / 2;
    } else if (resizeType == 1 && arrayType == 0) {
        this->capElems = this->capElems * 2;
    } else {
        this->capPos = this->capPos * 2;
    }
    if (arrayType == 0) {
        auto *temp = new TElem[this->capElems];
        for (int i = 0; i < this->nrElems; i++) {
            temp[i] = this->elems[i];
        }
        delete[] this->elems;
        elems = temp;
    } else {
        auto *temp = new int[this->capPos];
        for (int i = 0; i < this->nrPos; i++) {
            temp[i] = this->pos[i];
        }
        delete[] this->pos;
        pos = temp;
    }
    // theta(n)
}

// resizeType-> 0 means resize down, 1 means resize up
// arrayType-> 0 means resize for array elems, 1 means resize for array pos


void Bag::add(TElem elem) {
    bool found = false;
    for(int i = 0; i < this->nrElems; i++){
        if(this->elems[i] == elem) {
            this->pos[this->nrPos] = i;
            this->nrPos++;
            found = true;
            break;
        }
    }
    if(!found){
        this->elems[nrElems] = elem;
        this->pos[this->nrPos] = nrElems;
        this->nrElems++;
        this->nrPos++;
    }

    if(nrPos == capPos){
        resize(1, 1);
    }
    if(nrElems == capElems){
        resize(1, 0);
    }
    // best-> theta(1) worst-> theta(n) general-> O(n)
}


bool Bag::remove(TElem elem) {
    if(nrOccurrences(elem) == 0){
        return false;
    }
    else{
        int deletedElem = -1;
        for (int i = 0; i < nrElems; i++) {
            if (this->elems[i] == elem) {
                deletedElem = i;
                break;
            }
        }
        int deletedPos = -1;
        for (int i = 0; i < nrPos; i++) {
            if (this->pos[i] == deletedElem) {
                deletedPos = i;
                break;
            }
        }
        if(nrOccurrences(elem) == 1) {
            auto *temp = new TElem[this->capElems];
            for(int i = 0; i < deletedElem; i++){
                temp[i] = this->elems[i];
            }
            for(int i = deletedElem + 1; i < nrElems; i++){
                temp[i-1] = this->elems[i];
                for(int j = 0; j < this->nrPos; j++){
                    if(this->pos[j] == i){
                        this->pos[j]--;
                    }
                }
            }
            delete[] this->elems;
            elems = temp;
            nrElems--;
        }
        auto *temp = new TElem[this->capPos];
        for (int i = 0; i < deletedPos; i++) {
            temp[i] = this->pos[i];
        }
        for (int i = deletedPos + 1; i < nrPos; i++) {
            temp[i - 1] = this->pos[i];
        }
        delete[] this->pos;
        pos = temp;
        nrPos--;

        if (nrElems < capElems / 2 && capElems != 1) {
            resize(0, 0);
        }
        if (nrPos < capPos / 2 && capPos != 1) {
            resize(0, 1);
        }
        return true;
        }
    // best-> theta(nrElems) worst-> theta(n) general-> O(n)
}


bool Bag::search(TElem elem) const {
	for(int i = 0; i < this->nrElems; i++){
        if(this->elems[i] == elem) {
            return true;
        }
    }
	return false;
    // best-> theta(1) worst-> theta(n) general-> O(n)
}

int Bag::nrOccurrences(TElem elem) const {
	int temp = -1, nrOcc = 0;
    for(int i = 0; i < this->nrElems; i++){
        if(this->elems[i] == elem) {
            temp = i;
            break;
        }
    }
    if(temp != -1){
        for(int i = 0; i < this->nrPos; i++){
            if(this->pos[i] == temp){
                nrOcc++;
            }
        }
    }
    return nrOcc;
    // best-> theta(nrElems) worst-> theta(n) general-> O(n)
}


int Bag::size() const {
	return nrPos;
    // theta(1)
}


bool Bag::isEmpty() const {
	if(this->nrPos == 0){
        return true;
    }
    return false;
    // theta(1)
}

BagIterator Bag::iterator() const {
	return BagIterator(*this);
    // theta(1)
}


Bag::~Bag() {
    delete[] this->elems;
    delete[] this->pos;
    // theta(2)
}

bool Bag::removeMaxFreq() {
    if(this->nrElems == 0)
        return false;
    else {
        // finding the element
        int maxFreq = 0;
        int maxPos = -1;
        TElem *freq = new TElem[this->nrElems];
        for (int i = 0; i < this->nrPos; i++) {
            freq[this->pos[i]] = 0;
        }
        for (int i = 0; i < this->nrPos; i++) {
            freq[this->pos[i]]++;
        }
        for (int i = 0; i < this->nrElems; i++) {
            if (freq[i] > maxFreq) {
                maxFreq = freq[i];
                maxPos = i;
            }
        }

        // deleting the positions of maxElem from the array pos
        auto *temporary = new TElem[this->capPos];
        int index = 0;
        for(int i = 0; i < nrPos; i++){
            if(this->pos[i] == maxPos){
                i++;
            }
            else{
                temporary[index] = pos[i];
                index++;
            }
        }
        delete this->pos;
        pos = temporary;
        nrPos = index;
        // deleting the element from the array elems
        auto *temp = new TElem[this->capElems];
        for(int i = 0; i < maxPos; i++){
            temp[i] = this->elems[i];
        }
        for(int i = maxPos + 1; i < nrElems; i++){
            temp[i-1] = this->elems[i];
            for(int j = 0; j < this->nrPos; j++){
                // the elements in the array elems after maxElem will have a position smaller by -1, we update that in the array pos
                if(this->pos[j] == i){
                    this->pos[j]--;
                }
            }
        }
        delete[] this->elems;
        elems = temp;
        nrElems--;
        if (nrElems < capElems / 2 && capElems != 1) {
            resize(0, 0);
        }
        while (nrPos < capPos / 2 && capPos != 1) {
            resize(0, 1);
        }
        return true;
    }
    // best-> theta(1) worst-> theta(n) general-> O(n)
}

