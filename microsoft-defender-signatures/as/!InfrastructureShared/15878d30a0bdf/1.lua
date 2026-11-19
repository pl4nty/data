-- Threat: !InfrastructureShared
-- Name: 15878d30a0bdf
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
