-- Threat: !InfrastructureShared
-- Name: 9678c7a25223
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
