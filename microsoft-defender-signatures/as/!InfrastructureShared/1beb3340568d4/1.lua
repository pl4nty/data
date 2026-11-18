-- Threat: !InfrastructureShared
-- Name: 1beb3340568d4
-- Type: 21
-- Includes: TechniqueTracker

if this_sigattrlog[9].matched and this_sigattrlog[9].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[9].utf8p2:match("filepath:(.+)")
  if l_0_0 == nil or l_0_0 == "" then
    return mp.CLEAN
  end
  bm.add_threat_file(l_0_0)
  AddResearchData("BM", true)
  return mp.INFECTED
end
return mp.CLEAN
