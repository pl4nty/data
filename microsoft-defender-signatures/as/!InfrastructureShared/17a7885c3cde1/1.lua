-- Threat: !InfrastructureShared
-- Name: 17a7885c3cde1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
