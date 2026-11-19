-- Threat: !InfrastructureShared
-- Name: 69b324bea78c
-- Type: 21
-- Includes: TechniqueTracker

if this_sigattrlog[1].matched and this_sigattrlog[2].matched then
  local l_0_0 = this_sigattrlog[1].timestamp
  local l_0_1 = this_sigattrlog[2].timestamp
  local l_0_2
  if l_0_0 > l_0_1 then
    l_0_2 = l_0_0 - l_0_1
  else
    l_0_2 = l_0_1 - l_0_0
  end
  if 50000000 < l_0_2 then
    return mp.CLEAN
  end
  TrackPidAndTechniqueBM("BM", "T1133", "tooldrop_by_remote_access_tool")
  return mp.INFECTED
end
return mp.CLEAN
