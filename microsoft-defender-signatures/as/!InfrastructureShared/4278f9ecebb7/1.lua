-- Threat: !InfrastructureShared
-- Name: 4278f9ecebb7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
