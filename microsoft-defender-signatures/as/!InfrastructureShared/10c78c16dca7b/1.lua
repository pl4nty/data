-- Threat: !InfrastructureShared
-- Name: 10c78c16dca7b
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
