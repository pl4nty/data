-- Threat: !InfrastructureShared
-- Name: 87788d938d6b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
