-- Threat: !InfrastructureShared
-- Name: 3978da16b6a3
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
