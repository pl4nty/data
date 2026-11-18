-- Threat: !InfrastructureShared
-- Name: dc7851d63d90
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
