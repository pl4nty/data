-- Threat: !InfrastructureShared
-- Name: 3f782650642e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
