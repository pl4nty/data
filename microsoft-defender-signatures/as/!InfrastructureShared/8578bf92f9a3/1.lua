-- Threat: !InfrastructureShared
-- Name: 8578bf92f9a3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
