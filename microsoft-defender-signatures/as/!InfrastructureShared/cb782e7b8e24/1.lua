-- Threat: !InfrastructureShared
-- Name: cb782e7b8e24
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
