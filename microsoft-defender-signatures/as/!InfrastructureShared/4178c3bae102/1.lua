-- Threat: !InfrastructureShared
-- Name: 4178c3bae102
-- Type: 21

local l_0_0 = pe.get_exports_count()
if peattributes.isdll == true and (l_0_0 == 10 or l_0_0 == 11) then
  return mp.INFECTED
end
return mp.CLEAN
