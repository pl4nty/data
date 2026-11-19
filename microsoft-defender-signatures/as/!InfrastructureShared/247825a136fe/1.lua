-- Threat: !InfrastructureShared
-- Name: 247825a136fe
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
