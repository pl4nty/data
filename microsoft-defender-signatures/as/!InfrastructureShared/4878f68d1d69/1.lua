-- Threat: !InfrastructureShared
-- Name: 4878f68d1d69
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
