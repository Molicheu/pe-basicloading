-- Variables
local firstSpawn = false
local disableManualShutdown = GetConvarInt('pe-basicloading:disableAutoShutdown', 0) == 1

-- Function to handle the shutdown process
local function shutdownHandler()
    if not firstSpawn then
        firstSpawn = true
        SendLoadingScreenMessage(json.encode({ fullyLoaded = true }))
        ShutdownLoadingScreenNui()
    end
end

-- Register event handler if manual shutdown is not disabled
if not disableManualShutdown then
    AddEventHandler('playerSpawned', shutdownHandler)
end

-- Export the shutdown function
exports('shutdown', shutdownHandler)
