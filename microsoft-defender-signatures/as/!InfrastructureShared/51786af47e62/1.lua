-- Threat: !InfrastructureShared
-- Name: 51786af47e62
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
