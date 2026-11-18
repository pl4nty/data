-- Threat: !InfrastructureShared
-- Name: 8a783633ae92
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
