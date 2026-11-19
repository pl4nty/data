-- Threat: !InfrastructureShared
-- Name: c178a2d5d7ca
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
