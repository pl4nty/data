-- Threat: !InfrastructureShared
-- Name: 62b3625a2bd9
-- Type: 21
-- Includes: TechniqueTracker

if this_sigattrlog[2].matched and this_sigattrlog[3].matched and this_sigattrlog[2].utf8p1 ~= nil and this_sigattrlog[3].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
  local l_0_1 = string.lower(this_sigattrlog[3].utf8p2)
  local l_0_2 = l_0_0:match("\\([^\\]+)$")
  if l_0_2 ~= nil and l_0_1:find(l_0_2, 1, true) then
    TrackPidAndTechniqueBM("BM", "T1220", "xsl_file_drop_and_exec:" .. l_0_2)
    return mp.INFECTED
  end
end
return mp.CLEAN
