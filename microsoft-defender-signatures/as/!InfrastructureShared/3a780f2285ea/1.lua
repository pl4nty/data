-- Threat: !InfrastructureShared
-- Name: 3a780f2285ea
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
