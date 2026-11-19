-- Threat: !InfrastructureShared
-- Name: 6c785a0b1529
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
