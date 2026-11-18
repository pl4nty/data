-- Threat: !InfrastructureShared
-- Name: 7678c2c5279b
-- Type: 21

if peattributes.ismsil ~= true then
  return mp.CLEAN
end
return mp.INFECTED
