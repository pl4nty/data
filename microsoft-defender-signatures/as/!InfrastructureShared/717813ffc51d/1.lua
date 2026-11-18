-- Threat: !InfrastructureShared
-- Name: 717813ffc51d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
