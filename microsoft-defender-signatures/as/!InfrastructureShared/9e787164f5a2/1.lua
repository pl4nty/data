-- Threat: !InfrastructureShared
-- Name: 9e787164f5a2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
