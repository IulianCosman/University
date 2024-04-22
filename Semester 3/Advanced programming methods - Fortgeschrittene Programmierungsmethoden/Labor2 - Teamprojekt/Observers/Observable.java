package map.project.demo.Observers;

import map.project.demo.Observers.Observer;

import java.util.ArrayList;

public interface Observable {

    public void addObserver(Observer observer);
    public void removeObserver(Observer observer);
    public void notifyObservers();
}