-- Threat: !InfrastructureShared
-- Name: 229b3d6adbc8b
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p1
end
if isTainted(l_0_0, "remote_file_created_taint") then
  return mp.INFECTED
end
if string.sub(l_0_0, 0, 5) == "/tmp/" or string.sub(l_0_0, 0, 9) == "/var/tmp/" or string.sub(l_0_0, 0, 9) == "/dev/shm/" then
  return mp.INFECTED
end
return mp.CLEAN
