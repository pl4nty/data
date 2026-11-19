-- Threat: !InfrastructureShared
-- Name: b5783cf7fcfa
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
