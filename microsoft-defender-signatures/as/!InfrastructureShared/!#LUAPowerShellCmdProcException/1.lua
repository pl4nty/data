-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUAPowerShellCmdProcException\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_0 ~= "powershell.exe" then
  return mp.CLEAN
end
local l_0_1 = (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSDEVICEPATH))
local l_0_2 = (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_FILEPATH))
if (string.find)(l_0_1, "\\microsoft\\windows defender advanced threat protection\\", 1, true) and ((string.find)(l_0_2, "\\windows\\systemtemp\\", 1, true) or (string.find)(l_0_2, "\\windows\\temp\\", 1, true)) then
  return mp.INFECTED
end
return mp.CLEAN

