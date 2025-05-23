-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\9fd7c9ef4ea7\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = nil, nil
local l_0_2 = nil
if not (mp.GetScannedPPID)() then
  return mp.CLEAN
end
local l_0_3 = nil
if not (mp.GetProcessCommandLine)((mp.GetScannedPPID)()) or #(mp.GetProcessCommandLine)((mp.GetScannedPPID)()) <= 10 then
  return mp.CLEAN
end
l_0_3 = (string.match)((mp.GetProcessCommandLine)((mp.GetScannedPPID)()), "or8ixLi90Mf%s+\"?%s*([A-Za-z0-9/%+=]+)")
if l_0_3 == nil then
  return mp.CLEAN
end
l_0_2 = (MpCommon.Base64Decode)(l_0_3)
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = l_0_2:lower()
local l_0_4 = nil
local l_0_5 = nil
local l_0_6 = {":\\\\programdata\\dell", ":\\\\programdata\\hp", ":\\\\programdata\\microsoft\\windows\\start menu\\programs\\startup", ":\\\\perflogs", ":\\\\windows\\\\help", ":\\\\windows\\\\debug", ":\\\\windows\\\\tapi", ":\\\\windows\\\\temp", ":\\\\intel"}
local l_0_7 = {":\\\\programdata$"}
if (string.match)(l_0_2, "\"command\":\"(%w+)\",") == nil or (string.match)(l_0_2, "\"command\":\"(%w+)\",") == "" then
  return mp.CLEAN
end
if (string.match)(l_0_2, "\"path\":\"computer\\\\(.*)\",\"name\"") == nil or (string.match)(l_0_2, "\"path\":\"computer\\\\(.*)\",\"name\"") == "" then
  return mp.CLEAN
end
local l_0_8 = nil
local l_0_9 = nil
local l_0_10 = contains
l_0_10 = l_0_10(l_0_8, {"upload", "download"})
if l_0_10 then
  l_0_10 = contains
  l_0_10 = l_0_10(l_0_9, l_0_6)
  if not l_0_10 then
    l_0_10 = contains
    l_0_10 = l_0_10(l_0_9, l_0_7, false)
  end
  if l_0_10 then
    l_0_10 = set_research_data
    l_0_10("atera_susp", l_0_2, false)
    l_0_10 = mp
    l_0_10 = l_0_10.INFECTED
    return l_0_10
  end
end
l_0_10 = mp
l_0_10 = l_0_10.CLEAN
return l_0_10

