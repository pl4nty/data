-- Threat: !InfrastructureShared
-- Name: 1a2b34c78ee6e
-- Type: 21

local l_0_0 = 0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].reg_new_value_size
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].reg_new_value_size
end
if 1000 < l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
