-- Threat: !InfrastructureShared
-- Name: 13e783ecca952
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
