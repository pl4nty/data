-- Threat: !InfrastructureShared
-- Name: 85402349684f
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 94000 then
  return mp.INFECTED
end
return mp.CLEAN
