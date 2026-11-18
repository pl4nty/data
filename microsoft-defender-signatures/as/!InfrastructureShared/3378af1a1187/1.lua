-- Threat: !InfrastructureShared
-- Name: 3378af1a1187
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
