-- Threat: !InfrastructureShared
-- Name: 4e78316dba38
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
