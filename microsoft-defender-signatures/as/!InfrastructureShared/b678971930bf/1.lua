-- Threat: !InfrastructureShared
-- Name: b678971930bf
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 7000 then
  return mp.INFECTED
end
return mp.CLEAN
