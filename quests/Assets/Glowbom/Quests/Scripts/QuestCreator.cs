using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class QuestCreator : MonoBehaviour
{
    QuestLoader loader = new QuestLoader();
    
    // Start is called before the first frame update
    void Start()
    {
        loader.load();
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void save() {
        loader.save();
    }

    public void load() {
        loader.load();
    }

    public void allNextPressed() {

    }

    public void allPreviousPressed() {

    }

    public void allValuesNextPressed() {

    }

    public void allValuesPreviousPressed() {

    }

    public void valuesNextPressed() {

    }

    public void valuesPreviousPressed() {

    }

    public void buttonsNextPressed() {

    }

    public void buttonsPreviousPressed() {

    }

    // All

    public void allTitlePressed(int i) {

    }

    public void allInsertPressed(int i) {
        
    }

    public void allRemovePressed(int i) {
        
    }

    public void allValueInsertPressed() {
        
    }

    public void allValueRemovePressed() {
        
    }

    // Buttons

    public void buttonInsertPressed(int i) {
        
    }

    public void buttonGoPressed(int i) {
        
    }

    public void buttonRemovePressed(int i) {
        
    }

    public void valueInsertPressed() {
        
    }

    public void valueRemovePressed() {
        
    }
}
