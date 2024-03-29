abstract class AppStates{}


//Main STATES

class AppInitialState extends AppStates{}

class AppChangeBottomNavBarState extends AppStates{}

class AppChangeActionState extends AppStates{}

class AppChangeThemeModeState extends AppStates{}


//QUIZ STATES

class AppQuizChangeIsLastState extends AppStates{}   //Change of screen happened in showing questions.

class AppQuizChangeIsVisibleState extends AppStates{}   //Change the Correct/False to not shown.

class AppQuizChangeIsCorrectState extends AppStates{}   //Change if the state is Correct.

class AppQuizChangeIsBoxTappedState extends AppStates{}   //Change if any answers boxes has been tapped.

class AppQuizChangeIsAnimationState extends AppStates{}   //Change animation to be true.

class AppQuizTotalMarkState extends AppStates{} //after Calculating quiz marks.

class AppQuizAddMarkState extends AppStates{} //Adding marks to student marks.

class AppQuizInitialMarkState extends AppStates{} //Setting initial mark


//-------------------------------------------------------\\

// API METHODS STATES.


// GET USER DATA:

class AppGetUserDataLoadingState extends AppStates{}

class AppGetUserDataSuccessState extends AppStates{}

class AppGetUserDataErrorState extends AppStates{}

//--------------


//GET ALL UNITS:

class AppGetAllUnitsLoadingState extends AppStates{}

class AppGetAllUnitsSuccessState extends AppStates{}

class AppGetAllUnitsErrorState extends AppStates{}

//-----------------------


//GET LANGUAGES:

class AppGetLanguagesLoadingState extends AppStates{}

class AppGetLanguagesSuccessState extends AppStates{}

class AppGetLanguagesErrorState extends AppStates{}


//-----------------------


//GET UNIT CONTENTS:

class AppGetUnitContentLoadingState extends AppStates{}

class AppGetUnitContentSuccessState extends AppStates{}

class AppGetUnitContentErrorState extends AppStates{}

//-----------------------


//GET ACHIEVEMENTS:

class AppGetAchievementsLoadingState extends AppStates{}

class AppGetAchievementsSuccessState extends AppStates{}

class AppGetAchievementsErrorState extends AppStates{}

//-----------------------

//GET USER ACHIEVEMENTS:

class AppGetUserAchievementsLoadingState extends AppStates{}

class AppGetUserAchievementsSuccessState extends AppStates{}

class AppGetUserAchievementsErrorState extends AppStates{}

//------------------------

// GET LATEST ACHIEVEMENTS: (NOT USED).

class AppGetLatestAchievementsLoadingState extends AppStates{}

class AppGetLatestAchievementsSuccessState extends AppStates{}

class AppGetLatestAchievementsErrorState extends AppStates{}

//GET LESSONS: (NOT USED).

class AppGetLessonsLoadingState extends AppStates{}

class AppGetLessonsSuccessState extends AppStates{}

class AppGetLessonsErrorState extends AppStates{}


//-----------------------


//GET QUESTIONS: (NOT USED).

class AppGetQuestionsLoadingState extends AppStates{}

class AppGetQuestionsSuccessState extends AppStates{}

class AppGetQuestionsErrorState extends AppStates{}

//-----------------------

// GET LEADERBOARDS:

class AppGetLeaderboardsLoadingState extends AppStates{}

class AppGetLeaderboardsSuccessState extends AppStates{}

class AppGetLeaderboardsErrorState extends AppStates{}

//----------------------

// GET USER FAVOURITES WORDS.

class AppGetFavouritesLoadingState extends AppStates{}

class AppGetFavouritesSuccessState extends AppStates{}

class AppGetFavouritesErrorState extends AppStates{}

//------------------------

// ADD FAVOURITES
class AppAddFavouritesLoadingState extends AppStates{}

class AppAddFavouritesSuccessState extends AppStates{}

class AppAddFavouritesErrorState extends AppStates{}


//----------------------

// DELETE A FAVOURITE WORD

class AppDeleteFavouritesLoadingState extends AppStates{}

class AppDeleteFavouritesSuccessState extends AppStates{}

class AppDeleteFavouritesErrorState extends AppStates{}

//PUT USER INFO:

class AppPutUserInfoLoadingState extends AppStates{}

class AppPutUserInfoSuccessState extends AppStates{}

class AppPutUserInfoErrorState extends AppStates{}



//----------------------------------------

// CHANGING FAV:

class AppWordChangeTrueFav extends AppStates{}

class AppWordChangeFalseFav extends AppStates{}


//----------------------


//POST TO ADD A LANGUAGE TO USER:

class AppPostUserLanguageLoadingState extends AppStates{}

class AppPostUserLanguageSuccessState extends AppStates{}

class AppPostUserLanguageErrorState extends AppStates{}


//----------------------


// SET UNIT AS COMPLETED FOR A USER:

class AppSetUnitAsCompletedLoadingState extends AppStates{}

class AppSetUnitAsCompletedSuccessState extends AppStates{}

class AppSetUnitAsCompletedErrorState extends AppStates{}


// UPDATE THE USER LANGUAGES AND UNITS LIST.

class AppUserLangUnitsLoadingState extends AppStates{}

class AppUserLangUnitsSuccessState extends AppStates{}

class AppUserLangUnitsErrorState extends AppStates{}


// SUBMIT A PARAGRAPH

class AppSubmitParagraphLoadingState extends AppStates{}

class AppSubmitParagraphSuccessState extends AppStates{}

class AppSubmitParagraphErrorState extends AppStates{}


//USER LOGOUT:

class AppUserSignOutLoadingState extends AppStates{}

class AppUserSignOutSuccessState extends AppStates{}

class AppUserSignOutErrorState extends AppStates{}

// GET TIPS:

class AppUserGetTipsLoadingState extends AppStates{}

class AppUserGetTipsSuccessState extends AppStates{}

class AppUserGetTipsErrorState extends AppStates{}