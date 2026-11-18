-- Threat: !InfrastructureShared
-- Name: e9b339bb8467
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if not this_sigattrlog[1].matched then
  return mp.CLEAN
end
if not this_sigattrlog[2].matched then
  return mp.CLEAN
end
local l_0_0 = bm.get_imagepath()
if isnull(l_0_0) then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if string.find(l_0_0, "\\windows defender\\msmpeng.exe", 1, true) then
  return mp.CLEAN
end
bm.add_related_string("msxsl_proc", l_0_0, bm.RelatedStringBMReport)
add_parents()
TrackPidAndTechniqueBM("BM", "T1220", "SuspMsxslExec")
return mp.INFECTED
