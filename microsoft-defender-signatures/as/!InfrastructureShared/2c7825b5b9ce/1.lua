-- Threat: !InfrastructureShared
-- Name: 2c7825b5b9ce
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
