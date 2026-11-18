-- Threat: !InfrastructureShared
-- Name: 6478884fca4e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
