-- Threat: !InfrastructureShared
-- Name: 2e78b3d8cae3
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("HSTR:GolangBinary") then
  return mp.INFECTED
end
return mp.CLEAN
