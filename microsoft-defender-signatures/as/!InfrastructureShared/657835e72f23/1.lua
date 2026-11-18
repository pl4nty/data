-- Threat: !InfrastructureShared
-- Name: 657835e72f23
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
