
#include <exception>
#include "ListIterator.h"
#include "IteratedList.h"

using namespace std;
IteratedList::IteratedList() {
    this->head = nullptr;
}

int IteratedList::size() const {
    int size = 0;
    if(head == nullptr)
        return size;
    else{
        node* temp = head;
        while(temp != nullptr) {
            size++;
            temp = temp->next;
        }
        return size;
    }
}

bool IteratedList::isEmpty() const {
    if(head == nullptr)
        return true;
    return false;
}

ListIterator IteratedList::first() const {
    return ListIterator(*this);
}

TElem IteratedList::getElement(ListIterator pos) const {
    if(pos.current != nullptr)
        return pos.current->data;
    else
        throw std::exception();
}

TElem IteratedList::remove(ListIterator& pos) {
    if(pos.current != nullptr) {
        if(pos.current == head)
        {
            TElem old_value = head->data;
            node *temp = head;
            head = head->next;
            pos.current = head;
            delete temp;
            return old_value;
        }
        else {
            node *previous = head;
            while (previous->next != pos.current)
                previous = previous->next;
            TElem old_value = pos.current->data;
            previous->next = pos.current->next;
            delete pos.current;
            pos.current = previous->next;
            return old_value;
        }
    }
    else
        throw std::exception();
}

ListIterator IteratedList::search(TElem e) const{
    ListIterator new_ListIterator(*this);
    new_ListIterator.current = nullptr;
    node* temp = head;
    while(temp != nullptr){
        if(temp->data == e)
            new_ListIterator.current = temp;
        temp = temp->next;
    }
    return new_ListIterator;
}

TElem IteratedList::setElement(ListIterator pos, TElem e) {
    if(pos.current != nullptr) {
            TElem old_value = pos.getCurrent();
            pos.current->data = e;
            return old_value;
    }
    else
        throw std::exception();
}

void IteratedList::addToPosition(ListIterator& pos, TElem e) {
    if(pos.current != nullptr) {
        node* new_node = new node;
        new_node->data = e;
        new_node->next = pos.current->next;
        pos.current->next = new_node;
        pos.current = pos.current->next;
    }
    else
        throw std::exception();
}

void IteratedList::addToEnd(TElem e) {
    node* new_node = new node;
    new_node->data = e;
    new_node->next = nullptr;
    if(head == nullptr)
        head = new_node;
    else {
        node* temp = head;
        while (temp->next != nullptr)
            temp = temp->next;
        temp->next = new_node;
    }
}

void IteratedList::addToBeginning(TElem e) {
    node* new_node = new node;
    new_node->data = e;
    new_node->next = head;
    head = new_node;
}

IteratedList::~IteratedList() {
    delete[] this->head;
}

void IteratedList::remove_k(int k) {
    if(k == 1)
        head = nullptr;
    else {
        ListIterator new_ListIterator(*this);
        int list_size = size();
        for(int i=1; i <= list_size; i++){
            if(i % k ==0)
                remove(new_ListIterator);
            else
                new_ListIterator.next();
        }
    }
}



