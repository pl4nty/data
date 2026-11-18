-- Threat: !InfrastructureShared
-- Name: 4d78f02d783c
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
