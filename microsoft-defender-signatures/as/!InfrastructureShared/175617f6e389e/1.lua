-- Threat: !InfrastructureShared
-- Name: 175617f6e389e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
