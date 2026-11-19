-- Threat: !InfrastructureShared
-- Name: 637878197695
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
