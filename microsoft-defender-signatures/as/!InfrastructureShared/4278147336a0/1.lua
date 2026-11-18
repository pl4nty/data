-- Threat: !InfrastructureShared
-- Name: 4278147336a0
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
