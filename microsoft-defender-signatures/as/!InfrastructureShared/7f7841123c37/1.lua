-- Threat: !InfrastructureShared
-- Name: 7f7841123c37
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
