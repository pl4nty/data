-- Threat: !InfrastructureShared
-- Name: f6b3b491cbd3
-- Type: 21

local l_0_0
if this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p2
elseif this_sigattrlog[6].matched then
  l_0_0 = this_sigattrlog[6].utf8p2
else
  return mp.CLEAN
end
if l_0_0 == nil or string.len(l_0_0) == 0 then
  return mp.CLEAN
end
return mp.INFECTED
