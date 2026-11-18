-- Threat: !InfrastructureShared
-- Name: 14378294dae62
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 1200000 then
  return mp.INFECTED
end
return mp.CLEAN
