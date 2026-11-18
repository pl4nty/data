-- Threat: !InfrastructureShared
-- Name: 28bb30e47f765
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[6].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[6].utf8p2)
  if string.find(l_0_0, "kaspersky", 1, true) or string.find(l_0_0, "little snitch", 1, true) or string.find(l_0_0, "norton", 1, true) or string.find(l_0_0, "avast", 1, true) or string.find(l_0_0, "mcafee", 1, true) or string.find(l_0_0, "avira", 1, true) or string.find(l_0_0, "sophos", 1, true) or string.find(l_0_0, "malwarebytes", 1, true) or string.find(l_0_0, "trendmicro", 1, true) or string.find(l_0_0, "bitdefender", 1, true) then
    TrackPidAndTechniqueBM("BM", "T1562.001", "DefenseEvasion_PRI0_ImpairDefenses_KillAV")
    return mp.INFECTED
  end
end
return mp.CLEAN
