```mermaid
mindmap
  root((User Goal:<br/>Find a Job))
    Initiation
      Open App
      Home Screen Loaded
      Decision: Has History?
        Yes
          Show Recent Tiles
        No
          Show Blank Fields
    Input Phase
      Enter Job Title
      Enter Location
        Option A: Manual Entry
        Option B: Use Current Location
          Check GPS Permission
            Denied
              Prompt Manual Entry
            Allowed
              Auto-Fill Location
    Execution
      Tap Search Button
      System Check: Valid Inputs?
        No
          Show Validation Error
          Loop Back to Input
        Yes
          Check Network
            Offline
              Show Offline Error
              Retry
            Online
              Fetch Results
    Consumption
      Outcome A: Results Found
        Scroll & Filter
        Tap Job Card
          Go to Job Detail
      Outcome B: No Results
        Show Empty State
        Suggest Broaden Search
        Clear Filters
    Conversion (Job Detail)
      Read Description
      Decision: Interested?
        Yes
          Click Apply Now
          Exit to Application
        Maybe
          Click Save Job
          Update Saved Jobs DB
        No
          Return to Results List
```