-- Threat: !InfrastructureShared
-- Name: 277848570a55
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
