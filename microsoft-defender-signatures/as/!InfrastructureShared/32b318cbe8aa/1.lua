-- Threat: !InfrastructureShared
-- Name: 32b318cbe8aa
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_0 ~= nil then
  if string.find(l_0_0, "/etc/ssh/", 1, true) then
    return mp.CLEAN
  elseif string.find(l_0_0, "sshd -f ", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
