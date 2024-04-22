
#include "PriorityQueue.h"
#include <exception>
#include <iostream>
using namespace std;


PriorityQueue::PriorityQueue(Relation r) {
	this->r = r;
    this->head = nullptr;
    // theta(1)
}


void PriorityQueue::push(TElem e, TPriority p) {
	if(head == nullptr) {
        this->head = new SLLNode;
        this->head->data.first = e;
        this->head->data.second = p;
        this->head->next = nullptr;
    }else {
        SLLNode* current = this->head;
        SLLNode* last = nullptr;
        auto* newNode = new SLLNode;
        newNode->data.first = e;
        newNode->data.second = p;
        while(current != nullptr){
            if(r(current->data.second, newNode->data.second)){
                last = current;
                current = current->next;
            }
            else{
                if(last == nullptr){
                    auto* lastHead = new SLLNode;
                    lastHead->data = this->head->data;
                    lastHead->next = this->head->next;
                    this->head = newNode;
                    this->head->next = lastHead;
                }
                else{
                    newNode->next = current;
                    last->next = newNode;
                }
                break;
            }
        }
        if(current == nullptr) {
            newNode->next = current;
            last->next = newNode;
        }
    }
}// best-> theta(1) worst-> theta(n) general->O(n)

//throws exception if the queue is empty
Element PriorityQueue::top() const {
	if(this->head == nullptr){
        throw exception();
    }
	else{
        return head->data;
    }
    // theta(1)
}

Element PriorityQueue::pop() {
    if(this->head == nullptr){
        throw exception();
    }
    else{
        Element data = this->head->data;
        this->head = this->head->next;
        return data;
    }
    // theta(1)
}

bool PriorityQueue::isEmpty() const {
	if(this->head == nullptr){
        return true;
    }
	return false;
    // theta(1)
}


PriorityQueue::~PriorityQueue() {
    while(this->head != nullptr){
        this->pop();
    }
    // theta(n)
};

void PriorityQueue::showQueue() {
    PriorityQueue temp(this->r);
    while(this->head != nullptr){
        Element data = this->pop();
        cout<<data.first<<" "<<data.second<<'\n';
        temp.push(data.first, data.second);
    }
    while(temp.head != nullptr){
        this->push(temp.head->data.first, temp.head->data.second);
        temp.pop();
    }

    // theta(n)
}

