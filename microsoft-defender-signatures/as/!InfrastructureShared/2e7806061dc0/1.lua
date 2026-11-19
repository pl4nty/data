-- Threat: !InfrastructureShared
-- Name: 2e7806061dc0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
