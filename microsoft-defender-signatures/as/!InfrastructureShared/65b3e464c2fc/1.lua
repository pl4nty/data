-- Threat: !InfrastructureShared
-- Name: 65b3e464c2fc
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_0 ~= nil and (l_0_0:match("\\windows\\tasks\\") or l_0_0:match("\\windows\\system32\\tasks\\")) then
  return mp.INFECTED
end
return mp.CLEAN
