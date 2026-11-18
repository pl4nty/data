-- Threat: !InfrastructureShared
-- Name: bb781801adfa
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
