-- Threat: !InfrastructureShared
-- Name: 577896177aec
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
