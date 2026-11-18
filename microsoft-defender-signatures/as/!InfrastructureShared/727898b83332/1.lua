-- Threat: !InfrastructureShared
-- Name: 727898b83332
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
