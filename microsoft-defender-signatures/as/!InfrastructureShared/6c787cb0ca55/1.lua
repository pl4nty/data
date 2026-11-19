-- Threat: !InfrastructureShared
-- Name: 6c787cb0ca55
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
