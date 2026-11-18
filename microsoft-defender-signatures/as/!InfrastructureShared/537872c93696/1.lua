-- Threat: !InfrastructureShared
-- Name: 537872c93696
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
