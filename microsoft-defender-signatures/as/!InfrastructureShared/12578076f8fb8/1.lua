-- Threat: !InfrastructureShared
-- Name: 12578076f8fb8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
