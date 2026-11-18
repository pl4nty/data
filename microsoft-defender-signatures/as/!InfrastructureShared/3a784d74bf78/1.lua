-- Threat: !InfrastructureShared
-- Name: 3a784d74bf78
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
