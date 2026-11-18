-- Threat: !InfrastructureShared
-- Name: 2678592d3e82
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("HSTR:GolangBinary") then
  return mp.INFECTED
end
return mp.CLEAN
