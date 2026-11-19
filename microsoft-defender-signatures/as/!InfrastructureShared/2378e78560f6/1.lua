-- Threat: !InfrastructureShared
-- Name: 2378e78560f6
-- Type: 21

local l_0_0 = pe.get_exports_count()
if peattributes.isdll and 3 < l_0_0 and l_0_0 < 14 then
  return mp.INFECTED
end
return mp.CLEAN
