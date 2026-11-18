-- Threat: !InfrastructureShared
-- Name: 8f784a1c85d6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
