-- Threat: !InfrastructureShared
-- Name: 11b61b46bdcb9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
