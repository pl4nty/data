-- Threat: !InfrastructureShared
-- Name: 73b35086a2b6
-- Type: 21

local l_0_0
if not this_sigattrlog[2].matched or this_sigattrlog[2].utf8p1 == nil or this_sigattrlog[2].utf8p1 == "" then
  return mp.CLEAN
end
l_0_0 = this_sigattrlog[2].utf8p1
if l_0_0:match("/%.[^/]+$") then
  return mp.INFECTED
end
return mp.CLEAN
