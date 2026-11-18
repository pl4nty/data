-- Threat: !InfrastructureShared
-- Name: 56788160af9b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
