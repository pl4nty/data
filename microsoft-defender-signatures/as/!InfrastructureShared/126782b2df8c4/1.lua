-- Threat: !InfrastructureShared
-- Name: 126782b2df8c4
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 5700 then
  return mp.INFECTED
end
return mp.CLEAN
