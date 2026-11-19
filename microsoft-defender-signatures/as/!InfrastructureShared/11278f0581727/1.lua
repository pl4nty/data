-- Threat: !InfrastructureShared
-- Name: 11278f0581727
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 15000 then
  return mp.INFECTED
end
return mp.CLEAN
