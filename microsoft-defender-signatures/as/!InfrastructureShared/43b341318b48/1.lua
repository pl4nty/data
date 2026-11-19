-- Threat: !InfrastructureShared
-- Name: 43b341318b48
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.image_path)
local l_0_2 = ""
if l_0_0.command_line ~= nil then
  l_0_2 = string.lower(l_0_0.command_line)
end
local l_0_3 = string.find(l_0_1, "\\node.exe", 1, true) and string.find(l_0_2, "openclaw", 1, true)
if not l_0_3 then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1071.001", "rogueclaw_mcp_channel")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
