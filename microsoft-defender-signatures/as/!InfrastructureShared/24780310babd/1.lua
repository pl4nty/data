-- Threat: !InfrastructureShared
-- Name: 24780310babd
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
