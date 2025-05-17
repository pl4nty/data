-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#BLKACC26190899-1602-49e8-8b27-\2.luac 

-- params : ...
-- function num : 0
if not (mp.IsHipsRuleEnabled)("26190899-1602-49e8-8b27-eb1d0a1ce869") then
  return mp.CLEAN
end
if peattributes.isdamaged then
  return mp.CLEAN
end
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
if not (mp.get_contextdata)(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) then
  return mp.CLEAN
end
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if (string.lower)(l_0_0) ~= "msedgewebview2.exe" then
  return mp.CLEAN
end
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = (MpCommon.PathToWin32Path)(l_0_1)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
local l_0_3 = (string.lower)(l_0_2 .. "\\" .. l_0_0)
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
local l_0_4 = (string.lower)((MpCommon.ExpandEnvironmentVariables)("%programfiles%"))
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if (string.find)(l_0_3, l_0_4 .. "[^\\]*\\microsoft\\edgewebview\\application\\[%d%.]+\\msedgewebview2.exe") == nil then
  return mp.CLEAN
end
local l_0_5 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_5 == nil or l_0_5 == "" then
  return mp.CLEAN
end
local l_0_6 = (string.lower)((mp.GetProcessCommandLine)(l_0_5))
if l_0_6 == nil or (string.len)(l_0_6) == 0 then
  return mp.CLEAN
end
local l_0_7, l_0_8 = (string.match)(l_0_6, "%-%-type=([^%s]+).*%-%-webview%-exe%-name=([^%s]+)")
if l_0_7 == nil or l_0_7 == "" then
  return mp.CLEAN
end
local l_0_9 = {}
l_0_9.renderer = true
l_0_9["gpu-process"] = true
l_0_9.utility = true
if l_0_9[l_0_7] ~= true then
  return mp.CLEAN
end
if l_0_8 == nil or l_0_8 == "" then
  return mp.CLEAN
end
local l_0_10 = {}
l_0_10["outlook.exe"] = true
l_0_10["olk.exe"] = true
if l_0_10[l_0_8] ~= true then
  return mp.CLEAN
end
local l_0_11 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_11 == nil or l_0_11 == "" then
  return mp.CLEAN
end
l_0_11 = (string.lower)((MpCommon.PathToWin32Path)(l_0_11))
if (mp.IsPathExcludedForHipsRule)(l_0_11, "26190899-1602-49e8-8b27-eb1d0a1ce869") then
  return mp.CLEAN
end
if (string.find)(l_0_11, ".:\\windows\\system32\\werfault%.exe") ~= nil then
  return mp.CLEAN
end
if (string.find)(l_0_11, ".:\\windows\\system32\\wermgr%.exe") ~= nil then
  return mp.CLEAN
end
if (string.find)(l_0_11, ".:\\windows\\syswow64\\wermgr%.exe") ~= nil then
  return mp.CLEAN
end
if (string.find)(l_0_11, ".:\\programdata\\app%-v\\[^\\]+\\[^\\]+\\root\\vfs\\programfilesx86\\microsoft\\edgewebview\\application\\[%d%.]+\\identity_helper%.exe") ~= nil then
  return mp.CLEAN
end
if (string.find)(l_0_11, l_0_4 .. "[^\\]*\\microsoft\\edgewebview\\application\\[%d%.]+\\identity_helper%.exe") ~= nil then
  return mp.CLEAN
end
if (string.find)(l_0_11, l_0_4 .. "[^\\]*\\sogouinput\\") ~= nil then
  return mp.CLEAN
end
if (string.find)(l_0_11, l_0_4 .. "[^\\]*\\sogouwbinput\\") ~= nil then
  return mp.CLEAN
end
if (string.find)(l_0_11, l_0_4 .. "[^\\]*\\tencent\\") ~= nil then
  return mp.CLEAN
end
if (string.find)(l_0_11, l_0_4 .. "[^\\]*\\microsoft office\\") ~= nil then
  return mp.CLEAN
end
if (string.find)(l_0_11, l_0_4 .. "[^\\]*\\adobe\\") ~= nil then
  return mp.CLEAN
end
if (string.find)(l_0_11, l_0_4 .. "[^\\]*\\google\\") ~= nil then
  return mp.CLEAN
end
if (string.find)(l_0_11, l_0_4 .. "[^\\]*\\7%-zip\\") ~= nil then
  return mp.CLEAN
end
return mp.INFECTED

