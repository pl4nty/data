-- Threat: !InfrastructureShared
-- Name: 9678061e8eb7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
