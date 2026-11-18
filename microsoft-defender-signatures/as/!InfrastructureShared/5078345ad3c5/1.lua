-- Threat: !InfrastructureShared
-- Name: 5078345ad3c5
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true and mp.getfilesize() < 30000 then
  return mp.INFECTED
end
return mp.CLEAN
