# Create your first trivia app

[![Build your own Quiz App](https://img.youtube.com/vi/5py0nFKtoLU/0.jpg)](https://www.youtube.com/watch?v=5py0nFKtoLU)

1. Download [Unity](https://unity3d.com/get-unity/download/archive) if you haven't done it already. We recommend Unity 2019.2.3.
2. Download [Glowbom Quests 1.0.0](https://github.com/Glowbom/quests/releases) (**glowbom-quests-1.0.0.unitypackage**).
3. Create a new 2D project in **Unity**.
4. Double click on **glowbom-quests-1.0.0.unitypackage** to import **Glowbom Quests** into your project.
5. Open **DesignClassic** scene from **Project** window in Unity. You can find **DesignClassic** scene file at **Assets/Glowbom/Quests**.
6. Switch the platform to iOS by going to **File->Build Settings...** and clicking on **Switch Platform**.
7. Open **Glowbom Quests Editor** by going to **Window->Glowbom->Quests**.
8. Insinde **Quests** panel in the **All** you can add, remove and modify screens.
9. To run the project, click on **Play** button.
10. Click on the first screen item from the **All** tab.
11. Modify screen **Title** and text.
12. Bellow **Title** and text you can find the decision buttons section. Each button has **Title**, **Go To** section, and **Answer**. **Go To** represents a screen number where the button leeds to. **Answer** field can highlight the right and wrong answers (value 1 means *right answer*, 0 means *wrong*). 
13. To highlight the right and wrong answers, you need to send **Answers Count** to more than 0. More than 1 means more than one correct answer, 1 means only 1 correct answer. If **Answers Count** is 0, there will be no highlighting at all.
14. To show the results, put [correctAnswers] and [totalQuestionsCount] inside the screen text field. The numbers will be replaced during the runtime. An example could be:

```
You got [correctAnswers] out of [totalQuestionsCount] questions correct.
```

15. To make some design changes, go to **Hierarchy**.
16. Select and expand **Canvas->Front** object to change the front screen of the app. **Canvas->Front->Title** and **Canvas->Front->Author** objects are usually used for displaying the app name and short description. You can also change text font and color from **Inspector**.
17. To change the main screen text select objects **Canvas->Panel->Title**, **Canvas->Panel->Text**, and for each button **Canvas->ButtonsPanel->Button->Text**, **Canvas->ButtonsPanel->Button1->Text**, etc. Each object can be easily moved around using the standard controls of Unity.
18. Background images can be changed from **Inspector** for **Canvas->Front** and **Canvas->Background** objects. You can use any image available in the plugin or choose your own if you put image files inside **Assets/Glowbom/Quests/Resources/** folder.
19. To build the project go to **File->Build Settings...**, click **Add Open Scenes** and **Build** buttons.
20. Open the project in Xcode.
21. Add your own signing certificate at **Unity-iPhone->Signing & Capabilities->Signing.**
22. Press **Play** button to run your app on the device.

### Example app

Please download an example app for [iOS](https://apps.apple.com/us/app/6-countries-world-geography/id1497861140?ls=1) and [Android](https://play.google.com/store/apps/details?id=com.glowbom.quests) to explore what's possible to build with **Glowbom Quests**.

# Monetize your app using AdMob

[![Build your own Quiz App](https://img.youtube.com/vi/xvx6RtHJNKg/0.jpg)](https://www.youtube.com/watch?v=xvx6RtHJNKg)

1. Set up a new app on [AdMob.com](https://admob.google.com/home/).
2. Opend **Window->Glowbom->Monetization** and copy App Id over there. Don't forget to press **Save** button.
3. Create Banner and Interstitial ads. We don't suppoort Rewarded and Native advanced ads yet.
4. Copy Ad Ids to **Glowbom Monetization** panel and press **Save** button.
5. Open **Player Settings** from **File->Build Settings...**.
6. In **Other Settings** section find **Scripting Define Symbols** field and put GLOWBOM_ADS constant over there.
7. Download [Google Mobile Ads Unity Plugin](https://github.com/googleads/googleads-mobile-unity/releases/tag/v4.2.1) and open the unitypackage file.
8. To enable Google Mobile Ads, go to **Assets->Google Mobile Ads->Settings...** and open **Inspector**.
9. Enable Google Mobile Ads and put App Id inside **Inspector** window.
10. Build the project by clicking on **Build** button in **File->Build Settings...**.
11. Open the project in Xcode.
12. Add your own signing certificate at **Unity-iPhone->Signing & Capabilities->Signing.**
13. Download [Google Mobile Ads SDK for iOS](https://developers.google.com/admob/ios/download) and unzip it to any folder you like.
14. Add **GoogleMobileAds.framework** from this folder to **Unity-iPhone->Build Phases->Link Binary With Libraries** by clicking on **+->Add Other...->Add Files...**.
15. Add a path to **Google Mobile Ads SDK** folder into **Framework Search Paths** at **Unity-iPhone->Build Settings** and make it recursive.
16. Open **Info.plist** file as **Source Code** from **Project navigator** and add **GADIsAdManagerApp** key set to **true**:

```
<key>GADIsAdManagerApp</key>
<true/>
```

17. Press **Play** button to run your app on the device.

# Deep dive into Glowbom Quests

**Glowbom Quests** supports multiple quests in the same application. You can add and remove quests in **Glowbom Quests** panel inside **Quests** tab. There are 3 field for each quest: **Name**, **Image**, and **Link**. If you have more than 1 quest in the app, you will see an additional quest selection menu when you launch you app. If **Image** field isn't empty, the quest button in the quest selection menu will show the background image instead of text. If **Image** is empty, the button will show the text from **Name** field. **Link** field should contain a file name of the quest.

Each quest has **Name** field. To load a new quest, just type a quest file name inside **Name** field and press **Load** button. You can also create a new quest if you type a new file name inside **Name** field and press **Save**. If you put a sprite name inside **Background Picture** field, the sprite will be shown in the background when you launch the quest.

Every quest screen item has decision buttons. Each button has **Title**, **Go To** section, and **Answer**. **Go To** represents a screen number where the button leeds to. The button becomes **Share** button if **Go To** has value of 10001, **Ask Friend** button if the values is 10002, and **Back** button if it's 10003.

The current version of **Glowbom Quests** has 3 design themes: **DesignClassic**, **DesignPenguin**, and **DesignWorld**. To switch the theme, just open a different scene file from **Project** window in Unity. The scene files are located in **Assets/Glowbom/Quests**. Each object on the scene can be easily moved around and changed using the standard controls of Unity. The main objects are a front screen (**Canvas->Front**), a background image (**Canvas->Background**), a main content title (**Canvas->Panel->Title**), a main content text (**Canvas->Panel->Text**), decision buttons (**Canvas->ButtonsPanel**), and a main image (**Canvas->ButtonsPanel->MainImage**).

### Optimization tips for iOS

1. Please read [optimizing the size of the built iOS Player Unity Manual](https://docs.unity3d.com/Manual/iphone-playerSizeOptimization.html) to reduce the build size for iOS.
2. Please read [reducing the file size of your build Unity Manual](https://docs.unity3d.com/Manual/ReducingFilesize.html).
3. Set **Enabled Bitcode** to **No** from  **Unity-iPhone->Build Settings** in Xcode.

### Optimization tips for Android

1. Please read a [practical guide to optimization for mobiles](https://docs.unity3d.com/Manual/MobileOptimizationPracticalGuide.html).
2. Build an [Android App Bundle](https://developer.android.com/guide/app-bundle) instead of a standard apk file to reduce the build size for Android.
3. Uncheck **x86** from **Target Architectures** in **Other Settings** of **Player Settings...**. Othervise, you will have [the following error](https://stackoverflow.com/questions/57629052/after-upgrading-my-unity-android-to-64-bit-i-still-get-an-error-after-uploading) after you upload a bundle to Google Play: 

```
This release is not compliant with the Google Play 64-bit requirement
```

# References

[Website](https://glowbom.com/)

[YouTube Channel](https://www.youtube.com/channel/UCrYQEQPhAHmn7N8W58nNwOw)

[Source](https://github.com/Glowbom)

[App Example](https://globalsculptor.com/apps/countries.html)


