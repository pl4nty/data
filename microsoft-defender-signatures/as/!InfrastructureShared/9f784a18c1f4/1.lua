-- Threat: !InfrastructureShared
-- Name: 9f784a18c1f4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
