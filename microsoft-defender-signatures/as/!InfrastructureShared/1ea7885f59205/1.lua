-- Threat: !InfrastructureShared
-- Name: 1ea7885f59205
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
