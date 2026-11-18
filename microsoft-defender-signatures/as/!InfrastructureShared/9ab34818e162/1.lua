-- Threat: !InfrastructureShared
-- Name: 9ab34818e162
-- Type: 21
-- Includes: TechniqueTracker

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[1].utf8p2
  local l_0_1 = l_0_0:match("RemoteIp:([^;]+)")
  if l_0_1 ~= nil and l_0_1 ~= "" then
    l_0_1 = string.lower(l_0_1)
    TrackAttackerServer(l_0_1)
    AddResearchData("BM", true)
    return mp.INFECTED
  end
end
return mp.CLEAN
