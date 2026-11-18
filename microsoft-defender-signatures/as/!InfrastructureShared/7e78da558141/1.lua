-- Threat: !InfrastructureShared
-- Name: 7e78da558141
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
