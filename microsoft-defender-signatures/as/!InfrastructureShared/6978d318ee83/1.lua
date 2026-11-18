-- Threat: !InfrastructureShared
-- Name: 6978d318ee83
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
