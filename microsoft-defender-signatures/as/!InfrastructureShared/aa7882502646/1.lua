-- Threat: !InfrastructureShared
-- Name: aa7882502646
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
