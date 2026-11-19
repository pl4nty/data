-- Threat: !InfrastructureShared
-- Name: 69b3f7dde6c3
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if string.find(l_0_0, "/dracut/", 1, true) then
  return mp.CLEAN
end
if isTainted(l_0_0, "remote_file_created_taint") then
  return mp.INFECTED
end
if string.sub(l_0_0, 0, 5) == "/tmp/" or string.sub(l_0_0, 0, 9) == "/var/tmp/" or string.sub(l_0_0, 0, 9) == "/dev/shm/" then
  return mp.INFECTED
end
return mp.CLEAN
