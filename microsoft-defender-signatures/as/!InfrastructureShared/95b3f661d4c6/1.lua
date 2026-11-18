-- Threat: !InfrastructureShared
-- Name: 95b3f661d4c6
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p1
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p1
end
if isTainted(l_0_0, "remote_file_created_taint") then
  return mp.INFECTED
end
if string.sub(l_0_0, 0, 5) == "/tmp/" or string.sub(l_0_0, 0, 9) == "/var/tmp/" or string.sub(l_0_0, 0, 9) == "/dev/shm/" then
  return mp.INFECTED
end
return mp.CLEAN
