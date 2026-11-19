-- Threat: !InfrastructureShared
-- Name: 10b781f15aed8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
