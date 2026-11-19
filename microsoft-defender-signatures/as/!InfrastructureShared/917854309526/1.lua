-- Threat: !InfrastructureShared
-- Name: 917854309526
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
