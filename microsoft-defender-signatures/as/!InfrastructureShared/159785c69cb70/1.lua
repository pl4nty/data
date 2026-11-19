-- Threat: !InfrastructureShared
-- Name: 159785c69cb70
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 150000 then
  return mp.INFECTED
end
return mp.CLEAN
