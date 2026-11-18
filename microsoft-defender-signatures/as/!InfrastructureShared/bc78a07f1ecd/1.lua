-- Threat: !InfrastructureShared
-- Name: bc78a07f1ecd
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
