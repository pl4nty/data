-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\8fd723cd0695\0x0000c015_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (((mp.GetProcessCommandLine)(l_0_0)):lower())
local l_0_2 = nil
if l_0_1 then
  l_0_2 = (string.match)(l_0_1, "wscript.*%s+%\"?%\'?(%w:\\.*%.js)")
end
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = (mp.GetParentProcInfo)()
if l_0_3 ~= nil then
  local l_0_4 = (string.lower)(l_0_3.image_path)
  local l_0_5 = l_0_4:match("([^\\]+)$")
  local l_0_6 = "iexplore.exe|browser_broker.exe|firefox.exe|chrome.exe|msedge.exe|opera.exe|safari.exe|microsoftedge.exe|microsoftedgecp.exe|explorer.exe"
  if (string.find)(l_0_6, l_0_5) then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

