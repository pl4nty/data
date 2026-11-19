-- Threat: !InfrastructureShared
-- Name: 10a78f7744a07
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 300000 then
  return mp.INFECTED
end
return mp.CLEAN
