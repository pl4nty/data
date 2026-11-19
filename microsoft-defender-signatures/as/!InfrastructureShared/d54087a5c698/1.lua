-- Threat: !InfrastructureShared
-- Name: d54087a5c698
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
