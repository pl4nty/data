-- Threat: !InfrastructureShared
-- Name: 5f7850a95104
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
