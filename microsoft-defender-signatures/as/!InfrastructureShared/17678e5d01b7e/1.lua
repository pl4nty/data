-- Threat: !InfrastructureShared
-- Name: 17678e5d01b7e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
