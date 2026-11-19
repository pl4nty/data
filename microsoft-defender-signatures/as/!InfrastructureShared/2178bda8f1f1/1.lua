-- Threat: !InfrastructureShared
-- Name: 2178bda8f1f1
-- Type: 21

local l_0_0 = pe.get_exports_count()
if peattributes.isdll and (l_0_0 == 4 or l_0_0 == 10 or l_0_0 == 11) then
  return mp.INFECTED
end
return mp.CLEAN
