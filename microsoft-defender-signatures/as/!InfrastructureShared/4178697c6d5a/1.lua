-- Threat: !InfrastructureShared
-- Name: 4178697c6d5a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
