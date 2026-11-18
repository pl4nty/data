-- Threat: !InfrastructureShared
-- Name: 4578f3b5392c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
