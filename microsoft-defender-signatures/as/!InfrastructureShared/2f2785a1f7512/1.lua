-- Threat: !InfrastructureShared
-- Name: 2f2785a1f7512
-- Type: 21

local l_0_0 = hstrlog[5].matched and hstrlog[6].matched
if l_0_0 and mp.HSTR_WEIGHT == 3 then
  return mp.CLEAN
end
if peattributes.hasstandardentry then
  return mp.CLEAN
end
return mp.INFECTED
