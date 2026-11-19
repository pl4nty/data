-- Threat: !InfrastructureShared
-- Name: 2b782e6fb1a7
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
