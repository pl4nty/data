-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\bdb3170bc084\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = GetRealPidForScenario(l_0_0.ppid)
local l_0_2 = l_0_0.command_line
if l_0_2 ~= nil and l_0_2 ~= "" and ((string.find)(l_0_2, "/Library/Application Support/JAMF/Jamf.app/", 1, true) or (string.find)(l_0_2, "/usr/local/jamf/bin/jamf", 1, true) or (string.find)(l_0_2, "GoogleUpdater --server", 1, true) or (string.find)(l_0_2, "GoogleUpdater --install", 1, true) or (string.find)(l_0_2, "/sbin/", 1, true) == 1) then
  return mp.CLEAN
end
AddResearchData(l_0_1, true)
reportRelatedBmHits()
return mp.INFECTED

