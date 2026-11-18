-- Threat: !InfrastructureShared
-- Name: 11378d44f17c8
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and mp.getfilesize() < 5072000 then
  return mp.INFECTED
end
return mp.CLEAN
