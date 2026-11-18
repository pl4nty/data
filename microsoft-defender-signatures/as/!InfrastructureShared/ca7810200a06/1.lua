-- Threat: !InfrastructureShared
-- Name: ca7810200a06
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
