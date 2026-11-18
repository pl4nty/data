-- Threat: !InfrastructureShared
-- Name: 37785fef9239
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("HSTR:GolangBinary") then
  return mp.INFECTED
end
return mp.CLEAN
