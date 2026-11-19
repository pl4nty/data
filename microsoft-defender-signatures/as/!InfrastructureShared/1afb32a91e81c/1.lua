-- Threat: !InfrastructureShared
-- Name: 1afb32a91e81c
-- Type: 21
-- Includes: TechniqueTracker

if this_sigattrlog[8].matched and this_sigattrlog[8].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[8].utf8p2:match("remoteshare_(.+)")
  if not l_0_0 then
    return mp.CLEAN
  end
  bm.add_related_file(l_0_0)
  AddResearchData("BM", true)
  return mp.INFECTED
end
return mp.CLEAN
