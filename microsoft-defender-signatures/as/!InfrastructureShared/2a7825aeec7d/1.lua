-- Threat: !InfrastructureShared
-- Name: 2a7825aeec7d
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
