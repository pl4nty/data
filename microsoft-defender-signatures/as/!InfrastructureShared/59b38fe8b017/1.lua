-- Threat: !InfrastructureShared
-- Name: 59b38fe8b017
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = 150000000
local l_0_1 = bm.GetSignatureMatchDuration()
if l_0_0 < l_0_1 then
  return mp.CLEAN
end
local l_0_2
if this_sigattrlog[1].matched and this_sigattrlog[1].wp2 ~= nil then
  l_0_2 = this_sigattrlog[1].utf8p2
end
if l_0_2 and string.find(l_0_2, "base64", 1, true) and 200 <= #l_0_2 then
  TrackPidAndTechniqueBM("BM", "T1059.004", "Execution_PythonReverseShell")
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
