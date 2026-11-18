-- Threat: !InfrastructureShared
-- Name: a478708eb23d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
