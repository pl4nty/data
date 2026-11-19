-- Threat: !InfrastructureShared
-- Name: 58783c8d158d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
