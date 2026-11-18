-- Threat: !InfrastructureShared
-- Name: 9e610200dbd5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
