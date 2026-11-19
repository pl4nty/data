-- Threat: !InfrastructureShared
-- Name: cc780fe558f2
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and mp.getfilesize() > 18000 and mp.getfilesize() < 22000 then
  return mp.INFECTED
end
return mp.CLEAN
