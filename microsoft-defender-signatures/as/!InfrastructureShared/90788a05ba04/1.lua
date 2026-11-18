-- Threat: !InfrastructureShared
-- Name: 90788a05ba04
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
