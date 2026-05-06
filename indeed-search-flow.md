```` ```mermaid ````
flowchart TD
    %% Styling
    classDef startend fill:#4CAF50,stroke:#333,stroke-width:2px,color:white;
    classDef action fill:#2196F3,stroke:#333,stroke-width:1px,color:white;
    classDef decision fill:#FF9800,stroke:#333,stroke-width:1px,color:white;
    classDef error fill:#F44336,stroke:#333,stroke-width:1px,color:white;
    classDef info fill:#9E9E9E,stroke:#333,stroke-width:1px,color:white;

    %% Nodes
    Start([Start]):::startend --> Home[Home Screen<br/>Search Bar Visible]:::action
    Home --> HasHistory{Has Search<br/>History?}:::decision
    
    HasHistory -- Yes --> ShowHistory[Show Recent<br/>Search Tiles]:::action
    HasHistory -- No --> BlankFields[Title & Location<br/>Fields Blank]:::info
    
    ShowHistory --> TapTitle[Tap Title Field]:::action
    BlankFields --> TapTitle
    
    TapTitle --> InputTitle[Enter Job Title<br/>Text Input]:::action
    InputTitle --> TapLoc[Tap Location Field]:::action
    
    TapLoc --> LocPrefilled{Location<br/>Prefilled?}:::decision
    LocPrefilled -- Yes --> ConfirmLoc[Confirm or<br/>Modify Location]:::action
    LocPrefilled -- No --> UseGeo{Use Current<br/>Location?}:::decision
    
    UseGeo -- Yes --> GeoCheck[Request GPS<br/>Permission]:::action
    GeoCheck -- Denied --> ManualLoc[Manual Location<br/>Entry Required]:::error
    GeoCheck -- Allowed --> AutoFill[Auto-Fill<br/>Location]:::action
    
    UseGeo -- No --> ManualLoc
    ConfirmLoc --> Validate{All Fields<br/>Valid?}:::decision
    AutoFill --> Validate
    ManualLoc --> Validate
    
    Validate -- No --> ErrorMsg[Show Validation<br/>Error Message]:::error
    ErrorMsg --> TapTitle
    
    Validate -- Yes --> SearchBtn[Tap Search<br/>Button]:::action
    SearchBtn --> NetworkCheck{Network<br/>Available?}:::decision
    NetworkCheck -- No --> OfflineError[Show Offline<br/>Error]:::error
    OfflineError --> SearchBtn
    NetworkCheck -- Yes --> Fetch[Fetch Results<br/>from API]:::action
    
    Fetch --> ResFound{Results<br/>Found?}:::decision
    ResFound -- No --> NoRes[Show 'No Jobs<br/>Found' State]:::error
    NoRes --> Suggest[Suggest: Broaden<br/>Search / Clear Filters]:::action
    Suggest --> TapTitle
    
    ResFound -- Yes --> ShowList[Display Results<br/>List]:::action
    ShowList --> TapJob[Tap Job Card]:::action
    
    TapJob --> Detail[Job Detail<br/>View]:::action
    Detail --> Interest{Interested<br/>in Job?}:::decision
    Interest -- Yes --> Apply[Click Apply<br/>Now]:::action
    Interest -- Maybe --> Save[Save Job<br/>to Favorites]:::action
    Interest -- No --> Back[Return to<br/>Results List]:::action
    
    Apply --> End([End Flow<br/>Application Started]):::startend
    Save --> End
    Back --> ShowList
```` ``` ````