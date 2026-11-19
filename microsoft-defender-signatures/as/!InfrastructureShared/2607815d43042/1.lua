-- Threat: !InfrastructureShared
-- Name: 2607815d43042
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and mp.getfilesize() < 92768 then
  return mp.INFECTED
end
return mp.CLEAN
