-- Threat: !InfrastructureShared
-- Name: 4d7857562baf
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
