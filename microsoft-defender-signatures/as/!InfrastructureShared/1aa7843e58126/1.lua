-- Threat: !InfrastructureShared
-- Name: 1aa7843e58126
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
