-- Threat: !InfrastructureShared
-- Name: ac7835559b77
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
