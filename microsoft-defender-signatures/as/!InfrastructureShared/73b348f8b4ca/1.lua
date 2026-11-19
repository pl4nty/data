-- Threat: !InfrastructureShared
-- Name: 73b348f8b4ca
-- Type: 21
-- Includes: TechniqueTracker

if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[3].utf8p2:match("filepath:(.+)")
  if not l_0_0 then
    return mp.CLEAN
  end
  bm.add_related_file(l_0_0)
  AddResearchData("BM", true)
  return mp.INFECTED
end
return mp.CLEAN
