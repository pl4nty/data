-- Threat: !InfrastructureShared
-- Name: ff78004d002a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
