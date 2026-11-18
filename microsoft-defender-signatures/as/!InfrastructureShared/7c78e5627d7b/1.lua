-- Threat: !InfrastructureShared
-- Name: 7c78e5627d7b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
