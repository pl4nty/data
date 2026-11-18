-- Threat: !InfrastructureShared
-- Name: 65785ce12dbd
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
