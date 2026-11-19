-- Threat: !InfrastructureShared
-- Name: b078019b7365
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
