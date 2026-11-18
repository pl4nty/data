-- Threat: !InfrastructureShared
-- Name: a878cb5dcbef
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
