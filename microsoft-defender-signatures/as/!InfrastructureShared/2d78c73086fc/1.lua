-- Threat: !InfrastructureShared
-- Name: 2d78c73086fc
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("HSTR:GolangBinary") then
  return mp.INFECTED
end
return mp.CLEAN
