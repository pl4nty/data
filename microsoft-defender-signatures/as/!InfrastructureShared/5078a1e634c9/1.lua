-- Threat: !InfrastructureShared
-- Name: 5078a1e634c9
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
