-- Threat: !InfrastructureShared
-- Name: 6a6154a970d7
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
