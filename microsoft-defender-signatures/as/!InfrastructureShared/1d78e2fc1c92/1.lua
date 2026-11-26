-- Threat: !InfrastructureShared
-- Name: 1d78e2fc1c92
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("HSTR:GolangBinary") then
  return mp.INFECTED
end
return mp.CLEAN
