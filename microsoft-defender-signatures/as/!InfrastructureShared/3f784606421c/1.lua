-- Threat: !InfrastructureShared
-- Name: 3f784606421c
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
