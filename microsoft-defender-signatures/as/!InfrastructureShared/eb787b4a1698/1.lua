-- Threat: !InfrastructureShared
-- Name: eb787b4a1698
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
