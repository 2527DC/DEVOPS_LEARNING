# Components

- Difference between View and SafeAreaView
  - SafeAreaView. : where it ignore the notches and the status bar  in the android app 
  - View :  is a basic building block of the react native app and it is used to display the content 
- ScrollView vs FlatList
- FlatList vs SectionList
- TouchableOpacity vs Pressable
- Image component
- TextInput
- Modal
- ActivityIndicator

# Navigation
- React Navigation
- Stack Navigation
- Bottom Tabs
- Drawer Navigation
- Passing parameters
- Difference between Stack and Tab Navigation?

# Performance

Questions:

Why app becomes slow?
Optimization


1. Why is keyExtractor={(item) => item.id} better than key={index}?  
Ans : it is because using keyExtractor  make the listing component to identify the item based on the id not on the index ie if we add or remove any item from the array the index of the item will change but the id will not change so it is better to use the keyExtractor to make the listing component to identify the item based on the id 