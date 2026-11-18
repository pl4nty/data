-- Threat: !InfrastructureShared
-- Name: 497846ae0c7e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
