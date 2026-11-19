-- Threat: !InfrastructureShared
-- Name: 7d786a3a6b00
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
