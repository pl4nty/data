-- Threat: !InfrastructureShared
-- Name: 9fd7c9ef4ea7
-- Type: 21
-- Includes: BMLuaLib, ResearchData

local l_0_0, l_0_1
local l_0_2 = mp.GetScannedPPID()
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = mp.GetProcessCommandLine(l_0_2)
if not l_0_3 or #l_0_3 <= 10 then
  return mp.CLEAN
end
l_0_1 = string.match(l_0_3, "or8ixLi90Mf%s+\"?%s*([A-Za-z0-9/%+=]+)")
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_0 = MpCommon.Base64Decode(l_0_1)
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = l_0_0:lower()
local l_0_4 = {
  ":\\\\programdata\\dell",
  ":\\\\programdata\\hp",
  ":\\\\programdata\\microsoft\\windows\\start menu\\programs\\startup",
  ":\\\\perflogs",
  ":\\\\windows\\\\help",
  ":\\\\windows\\\\debug",
  ":\\\\windows\\\\tapi",
  ":\\\\windows\\\\temp",
  ":\\\\intel"
}
local l_0_5 = {
  ":\\\\programdata$"
}
local l_0_6 = string.match(l_0_0, "\"command\":\"(%w+)\",")
local l_0_7 = string.match(l_0_0, "\"path\":\"computer\\\\(.*)\",\"name\"")
if l_0_6 == nil or l_0_6 == "" then
  return mp.CLEAN
end
if l_0_7 == nil or l_0_7 == "" then
  return mp.CLEAN
end
if contains(l_0_6, {"upload", "download"}) and (contains(l_0_7, l_0_4) or contains(l_0_7, l_0_5, false)) then
  set_research_data("atera_susp", l_0_0, false)
  return mp.INFECTED
end
return mp.CLEAN
