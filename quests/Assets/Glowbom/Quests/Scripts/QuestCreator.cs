using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

/*
 * Created on Sun Jul 30 2019
 *
 * Copyright (c) 2019 Glowbom.
 */
public class QuestCreator : MonoBehaviour
{
    public Text projectName;
    // All
    public Button allPreviousButton;
    public Button allNextButton;
    public Button[] allTitleButtons;
    public Button[] allInsertButtons;
    public Button[] allRemoveButtons;
    public GameObject allValues;
    public InputField allValuesName;
    public InputField allValuesValue;

    // Item
    public InputField title;
    public InputField description;
    public GameObject values;
    public InputField valuesName;
    public InputField valuesValue;
    // Go To Buttons
    public Text[] buttonTexts;
    public InputField[] buttonTitles;
    public InputField[] buttonValues;
    public Button[] buttonGoButtons;
    public Button[] buttonInsertButtons;
    public Button[] buttonRemoveButtons;

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

    public void backPressed() {
        gameObject.SetActive(false);
    }
}
