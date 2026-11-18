-- Threat: !InfrastructureShared
-- Name: 8f78452931bf
-- Type: 21

if peattributes.isexe == true and peattributes.isvbnative == true then
  return mp.INFECTED
end
return mp.CLEAN
