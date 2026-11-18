-- Threat: !InfrastructureShared
-- Name: 6278326c9c10
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
