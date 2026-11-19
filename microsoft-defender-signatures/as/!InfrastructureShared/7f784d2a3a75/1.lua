-- Threat: !InfrastructureShared
-- Name: 7f784d2a3a75
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
