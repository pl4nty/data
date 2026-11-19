-- Threat: !InfrastructureShared
-- Name: 53781df2c916
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
