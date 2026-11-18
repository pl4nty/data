-- Threat: !InfrastructureShared
-- Name: 297813368b2b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
