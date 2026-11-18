-- Threat: !InfrastructureShared
-- Name: 2a780d730b6c
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
