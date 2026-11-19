-- Threat: !InfrastructureShared
-- Name: 50789b5bf50e
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
