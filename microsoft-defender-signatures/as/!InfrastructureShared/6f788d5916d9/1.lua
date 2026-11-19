-- Threat: !InfrastructureShared
-- Name: 6f788d5916d9
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
