-- Threat: !InfrastructureShared
-- Name: 8a784a0017d6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
