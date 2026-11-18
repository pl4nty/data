-- Threat: !InfrastructureShared
-- Name: 9d782b272d0c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
