-- Threat: !InfrastructureShared
-- Name: 4578efb33d69
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
