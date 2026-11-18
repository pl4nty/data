-- Threat: !InfrastructureShared
-- Name: 156b36761c9c2
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  if string.find(l_0_0, "\\ivanti cloud agent\\", 1, true) then
    return mp.CLEAN
  end
end
TrackPidAndTechniqueBM("BM", "T1560", "data_archive")
return mp.INFECTED
