-- Threat: !InfrastructureShared
-- Name: 76788aebb7ac
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
