-- Threat: !InfrastructureShared
-- Name: 3078d8027b89
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
