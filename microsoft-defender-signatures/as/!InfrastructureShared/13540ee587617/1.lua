-- Threat: !InfrastructureShared
-- Name: 13540ee587617
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
