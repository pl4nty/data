-- Threat: !InfrastructureShared
-- Name: 71787f8130c7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
