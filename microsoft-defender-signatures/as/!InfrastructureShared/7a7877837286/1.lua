-- Threat: !InfrastructureShared
-- Name: 7a7877837286
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
