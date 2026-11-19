-- Threat: !InfrastructureShared
-- Name: d1787d978e25
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
