-- Threat: !InfrastructureShared
-- Name: 43788ce101e3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
