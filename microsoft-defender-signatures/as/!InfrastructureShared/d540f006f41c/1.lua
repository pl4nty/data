-- Threat: !InfrastructureShared
-- Name: d540f006f41c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
