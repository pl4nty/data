-- Threat: !InfrastructureShared
-- Name: bc7851a5f584
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
