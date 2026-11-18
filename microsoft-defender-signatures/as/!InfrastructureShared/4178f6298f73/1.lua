-- Threat: !InfrastructureShared
-- Name: 4178f6298f73
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
