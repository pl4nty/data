-- Threat: !InfrastructureShared
-- Name: 19a617f0a9231
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
