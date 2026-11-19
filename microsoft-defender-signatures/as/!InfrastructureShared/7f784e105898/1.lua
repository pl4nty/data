-- Threat: !InfrastructureShared
-- Name: 7f784e105898
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
