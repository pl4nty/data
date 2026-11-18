-- Threat: !InfrastructureShared
-- Name: 5678e6c2eb5d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
