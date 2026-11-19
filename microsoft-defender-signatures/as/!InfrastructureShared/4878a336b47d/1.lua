-- Threat: !InfrastructureShared
-- Name: 4878a336b47d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
