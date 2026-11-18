-- Threat: !InfrastructureShared
-- Name: 49780943ea78
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
