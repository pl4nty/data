-- Threat: !InfrastructureShared
-- Name: ab784178b051
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
