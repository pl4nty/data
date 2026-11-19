-- Threat: !InfrastructureShared
-- Name: 150b3a32d85aa
-- Type: 21
-- Includes: TechniqueTracker

if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[6].utf8p2:match("filepath:([^;]+);?")
  if not l_0_0 then
    return mp.CLEAN
  end
  if sysio.IsFileExists(l_0_0) then
    bm.add_threat_file(l_0_0)
  end
  AddResearchData("BM", true)
  return mp.INFECTED
end
return mp.CLEAN
