
def list_windows_for_glazewm () {
   glazewm.exe query windows  | 
       from json | 
       get data.windows |  
       select title className processName hasFocus state.type displayState
}
