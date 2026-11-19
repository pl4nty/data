-- Threat: !InfrastructureShared
-- Name: bb78ae9bcad0
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 2020000 then
  return mp.INFECTED
end
return mp.CLEAN
