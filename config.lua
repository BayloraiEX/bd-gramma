--[[
  ____              _                 _                       
 | __ )  __ _ _   _| | ___  _ __ __ _(_)                      
 |  _ \ / _` | | | | |/ _ \| '__/ _` | |                      
 | |_) | (_| | |_| | | (_) | | | (_| | |                      
 |____/ \__,_|\__, |_|\___/|_|  \__,_|_|                  _   
 |  _ \  _____|___/___| | ___  _ __  _ __ ___   ___ _ __ | |_ 
 | | | |/ _ \ \ / / _ \ |/ _ \| '_ \| '_ ` _ \ / _ \ '_ \| __|
 | |_| |  __/\ V /  __/ | (_) | |_) | | | | | |  __/ | | | |_ 
 |____/ \___| \_/ \___|_|\___/| .__/|_| |_| |_|\___|_| |_|\__|
                              |_|                             
--]] 
Config = {}

Config.AmulanceJob = 'qb' -- Supports 'qb' & 'ars' ( qb-ambulancejob & ars_ambulancejob ) ( IF  USING ESX CHANGE TO 'esx' )
Config.ReviveTime = 15000 -- The Time It Takes For Gramma To Revive You ( Default 15 seconds )
Config.GrammaCost = 2500 -- The Amount Gramma Takes To Revive You ( Default is $2,500 )

Config.GrammaPed = {
    {
        GrammaPedModel = 'ig_mrs_thornhill',
        GrammaPedLocation = vector4(2810.74, 5983.58, 349.92, 280.37),
        GrammaPedRenderDistance = 10,
    }
}
