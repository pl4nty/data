-- Threat: !InfrastructureShared
-- Name: 81b38067057f
-- Type: 21
-- Includes: TechniqueTracker

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  if string.find(l_0_0, "system32\\mmc.exe", 1, true) then
    return mp.CLEAN
  end
end
TrackPidAndTechniqueBM("BM", "T1548.002", "uac_bypass_src")
return mp.INFECTED
