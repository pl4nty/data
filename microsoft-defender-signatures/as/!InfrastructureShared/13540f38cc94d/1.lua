-- Threat: !InfrastructureShared
-- Name: 13540f38cc94d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
