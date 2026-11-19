-- Threat: !InfrastructureShared
-- Name: 1f9b3adce193e
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if l_0_0 ~= nil and (string.sub(l_0_0, 0, 5) == "/tmp/" or string.sub(l_0_0, 0, 9) == "/var/tmp/" or string.sub(l_0_0, 0, 9) == "/dev/shm/") then
  return mp.INFECTED
end
return mp.CLEAN
