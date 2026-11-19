-- Threat: !InfrastructureShared
-- Name: 367819df5e59
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
