-- Threat: !InfrastructureShared
-- Name: a2b39ef24313
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p1
end
if this_sigattrlog[4].matched and this_sigattrlog[4].wp2 ~= nil then
  l_0_1 = this_sigattrlog[4].utf8p2
end
if l_0_1 ~= nil and (string.find(l_0_1, "-iname", 1, true) or string.find(l_0_1, "-name", 1, true) or string.find(l_0_1, "-iregex", 1, true) or string.find(l_0_1, "-regex", 1, true)) and (string.find(l_0_1, "/root/", 1, true) or string.find(l_0_1, "/home/ ", 1, true)) then
  if isTainted(l_0_0, "remote_file_created_taint") then
    return mp.INFECTED
  end
  if string.sub(l_0_0, 0, 5) == "/tmp/" or string.sub(l_0_0, 0, 9) == "/var/tmp/" or string.sub(l_0_0, 0, 9) == "/dev/shm/" then
    return mp.INFECTED
  end
end
return mp.CLEAN
