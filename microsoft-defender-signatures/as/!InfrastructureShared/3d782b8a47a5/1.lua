-- Threat: !InfrastructureShared
-- Name: 3d782b8a47a5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
