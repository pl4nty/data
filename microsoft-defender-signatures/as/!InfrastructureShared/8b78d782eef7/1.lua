-- Threat: !InfrastructureShared
-- Name: 8b78d782eef7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
