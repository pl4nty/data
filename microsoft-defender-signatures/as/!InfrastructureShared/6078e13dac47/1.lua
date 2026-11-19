-- Threat: !InfrastructureShared
-- Name: 6078e13dac47
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
