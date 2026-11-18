-- Threat: !InfrastructureShared
-- Name: 32b3ed5530b6
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_imagepath() or ""
l_0_0 = string.lower(l_0_0)
if l_0_0 == "" then
  return mp.CLEAN
end
if contains(l_0_0, {
  "/bun-dl-",
  "/trinnyyyy-",
  "/doubletrinnys-"
}) then
  bm.add_related_string("SuspBunExecPath", l_0_0, bm.RelatedStringBMReport)
  TrackPidAndTechniqueBM("BM", "T1105", "npm_bun_temp_exec")
  add_parents()
  local l_0_1, l_0_2 = pcall(reportBmInfo)
  if not l_0_1 and l_0_2 then
    bm.add_related_string("bmInfoFailReason", tostring(l_0_2), bm.RelatedStringBMReport)
  end
  return mp.INFECTED
end
return mp.CLEAN
