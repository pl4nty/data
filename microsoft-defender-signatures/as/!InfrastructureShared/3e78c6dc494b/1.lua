-- Threat: !InfrastructureShared
-- Name: 3e78c6dc494b
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
