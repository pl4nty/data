-- Threat: !InfrastructureShared
-- Name: 7d784e245d26
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
