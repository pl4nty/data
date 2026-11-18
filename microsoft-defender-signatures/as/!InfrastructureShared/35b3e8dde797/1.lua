-- Threat: !InfrastructureShared
-- Name: 35b3e8dde797
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if string.sub(l_0_0, 0, 5) == "/tmp/" or string.sub(l_0_0, 0, 9) == "/var/tmp/" or string.sub(l_0_0, 0, 9) == "/dev/shm/" or string.sub(l_0_0, 0, 10) == "/var/mail/" or string.sub(l_0_0, 0, 16) == "/var/spool/mail/" or string.sub(l_0_0, 0, 10) == "/var/lock/" or string.sub(l_0_0, 0, 6) == "/home/" then
  TrackPidAndTechniqueBM("BM", "T1486", "Impact_Ransom")
  return mp.INFECTED
end
return mp.CLEAN
