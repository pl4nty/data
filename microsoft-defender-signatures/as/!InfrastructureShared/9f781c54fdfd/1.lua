-- Threat: !InfrastructureShared
-- Name: 9f781c54fdfd
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
