-- Threat: !InfrastructureShared
-- Name: 5a78fc119038
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
