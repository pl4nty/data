-- Threat: !InfrastructureShared
-- Name: 6b78b99b13e6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
