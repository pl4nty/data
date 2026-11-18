-- Threat: !InfrastructureShared
-- Name: 10540e0b3ccec
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
