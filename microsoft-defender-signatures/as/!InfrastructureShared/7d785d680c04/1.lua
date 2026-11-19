-- Threat: !InfrastructureShared
-- Name: 7d785d680c04
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
