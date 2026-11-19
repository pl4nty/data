-- Threat: !InfrastructureShared
-- Name: 12878ac3efcfb
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
