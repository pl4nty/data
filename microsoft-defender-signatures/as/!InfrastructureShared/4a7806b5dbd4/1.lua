-- Threat: !InfrastructureShared
-- Name: 4a7806b5dbd4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
