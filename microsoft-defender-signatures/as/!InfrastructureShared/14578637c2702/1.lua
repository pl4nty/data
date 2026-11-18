-- Threat: !InfrastructureShared
-- Name: 14578637c2702
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
