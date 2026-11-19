-- Threat: !InfrastructureShared
-- Name: 6d7879221d7b
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and mp.getfilesize() < 5000000 then
  return mp.INFECTED
end
return mp.CLEAN
