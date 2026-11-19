-- Threat: !InfrastructureShared
-- Name: 1b7896a82c48
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
