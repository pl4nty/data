-- Threat: !InfrastructureShared
-- Name: f5405dca188b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
