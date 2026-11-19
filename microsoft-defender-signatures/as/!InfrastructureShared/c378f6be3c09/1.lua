-- Threat: !InfrastructureShared
-- Name: c378f6be3c09
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
