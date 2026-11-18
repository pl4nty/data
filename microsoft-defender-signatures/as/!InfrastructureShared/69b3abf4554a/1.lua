-- Threat: !InfrastructureShared
-- Name: 69b3abf4554a
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if isTainted(l_0_0, "remote_file_created_taint") and string.find(l_0_0, "/home/", 1, true) ~= 1 then
  TrackPidAndTechniqueBM("BM", "T1098.004", "Persistence")
  return mp.INFECTED
end
if string.sub(l_0_0, 0, 5) == "/tmp/" or string.sub(l_0_0, 0, 9) == "/var/tmp/" or string.sub(l_0_0, 0, 9) == "/dev/shm/" then
  TrackPidAndTechniqueBM("BM", "T1098.004", "Persistence")
  return mp.INFECTED
end
return mp.CLEAN
