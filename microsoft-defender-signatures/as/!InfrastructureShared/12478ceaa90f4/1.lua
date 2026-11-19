-- Threat: !InfrastructureShared
-- Name: 12478ceaa90f4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
