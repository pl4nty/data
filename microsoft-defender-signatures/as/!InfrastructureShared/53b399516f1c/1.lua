-- Threat: !InfrastructureShared
-- Name: 53b399516f1c
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if string.find(l_0_0, "--ignore-existing", 1, true) and string.find(l_0_0, "--auto-confirm", 1, true) and string.find(l_0_0, "--transfers", 1, true) and string.find(l_0_0, "--multi-thread-streams", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
