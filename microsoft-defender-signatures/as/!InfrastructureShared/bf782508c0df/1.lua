-- Threat: !InfrastructureShared
-- Name: bf782508c0df
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
