-- Threat: !InfrastructureShared
-- Name: 1e878f07645b3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
