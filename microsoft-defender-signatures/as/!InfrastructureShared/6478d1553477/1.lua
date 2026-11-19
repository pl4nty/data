-- Threat: !InfrastructureShared
-- Name: 6478d1553477
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
