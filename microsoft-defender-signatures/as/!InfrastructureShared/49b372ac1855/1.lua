-- Threat: !InfrastructureShared
-- Name: 49b372ac1855
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
end
if l_0_0 and (string.sub(l_0_0, 0, 5) == "/bin/" or string.sub(l_0_0, 0, 6) == "/sbin/" or string.sub(l_0_0, 0, 9) == "/usr/bin/" or string.sub(l_0_0, 0, 10) == "/usr/sbin/") then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1003.008", "CredentialAccess")
return mp.INFECTED
