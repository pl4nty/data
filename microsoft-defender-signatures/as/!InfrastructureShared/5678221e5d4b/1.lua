-- Threat: !InfrastructureShared
-- Name: 5678221e5d4b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
