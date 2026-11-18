-- Threat: !InfrastructureShared
-- Name: 95786fca7384
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
