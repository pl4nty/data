-- Threat: !InfrastructureShared
-- Name: 9fb3239c3438
-- Type: 21

if not this_sigattrlog[2].matched then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[2].utf8p2
if l_0_0 == nil then
  return mp.CLEAN
end
if 600 <= #l_0_0 and #l_0_0 <= 2500 then
  return mp.INFECTED
end
return mp.CLEAN
