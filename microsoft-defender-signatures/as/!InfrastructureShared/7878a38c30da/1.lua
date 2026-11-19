-- Threat: !InfrastructureShared
-- Name: 7878a38c30da
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
