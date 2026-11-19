-- Threat: !InfrastructureShared
-- Name: 6f978aa8124f6
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
