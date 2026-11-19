-- Threat: !InfrastructureShared
-- Name: 5f6b36597aaaf
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = 150000000
local l_0_1 = bm.GetSignatureMatchDuration()
if l_0_0 < l_0_1 then
  return mp.CLEAN
end
local l_0_2
if this_sigattrlog[1].matched and this_sigattrlog[1].wp2 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_2 ~= nil then
  if string.find(l_0_2, "initramfs ", 1, true) or string.find(l_0_2, "dracut", 1, true) or string.match(l_0_2, "python%d python") or string.match(l_0_2, "python%d%.[%d]+ python") then
    return mp.CLEAN
  end
  addRelatedProcess()
  reportRelatedBmHits()
  TrackPidAndTechniqueBM("BM", "T1036.003", "RenameBin_DefenseEvasion")
  return mp.INFECTED
end
return mp.CLEAN
