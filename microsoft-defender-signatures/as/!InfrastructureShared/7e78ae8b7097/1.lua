-- Threat: !InfrastructureShared
-- Name: 7e78ae8b7097
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
