-- Threat: !InfrastructureShared
-- Name: 58785161bae2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
