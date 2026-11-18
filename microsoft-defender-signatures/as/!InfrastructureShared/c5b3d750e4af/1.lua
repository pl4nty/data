-- Threat: !InfrastructureShared
-- Name: c5b3d750e4af
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = versioning.GetOrgID()
l_0_0 = string.lower(l_0_0)
if l_0_0 == "8a3d3271-36c5-4e53-942a-99bab70de223" or l_0_0 == "0a78c000-0352-4e17-9017-de92ad94ca06" then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1133", "tooldrop_by_remote_access_tool")
return mp.INFECTED
