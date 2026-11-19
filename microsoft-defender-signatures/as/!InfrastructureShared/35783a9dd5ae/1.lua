-- Threat: !InfrastructureShared
-- Name: 35783a9dd5ae
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
