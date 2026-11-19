-- Threat: !InfrastructureShared
-- Name: 9778ee62e701
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
