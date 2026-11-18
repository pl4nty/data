-- Threat: !InfrastructureShared
-- Name: 60782956c9f0
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
