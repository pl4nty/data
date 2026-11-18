-- Threat: !InfrastructureShared
-- Name: 3db3372208e4
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  if string.find(l_0_0, "ldap://", 1, true) or string.find(l_0_0, "ldaps://", 1, true) then
    TrackPidAndTechniqueBM("BM", "T1069.002", "Discovery_DomainGroups")
    return mp.INFECTED
  end
end
return mp.CLEAN
