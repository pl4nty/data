-- Threat: !InfrastructureShared
-- Name: 7e7893c63e75
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
