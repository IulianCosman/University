#include "ListIterator.h"
#include "IteratedList.h"
#include <exception>

ListIterator::ListIterator(const IteratedList& list) : list(list) {
    this->current = list.head;
}

void ListIterator::first() {
    current = list.head;
}

void ListIterator::next() {
    if(current != nullptr)
        current = current->next;
    else
        throw std::exception();

}

bool ListIterator::valid() const {
    if(current != nullptr)
        return true;
    return  false;
}

TElem ListIterator::getCurrent() const {
    if(current != nullptr)
        return current->data;
    else
        throw std::exception();
}




