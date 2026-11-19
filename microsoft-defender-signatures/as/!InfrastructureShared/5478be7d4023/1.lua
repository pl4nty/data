-- Threat: !InfrastructureShared
-- Name: 5478be7d4023
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("HSTR:GolangBinary") then
  return mp.INFECTED
end
return mp.CLEAN
