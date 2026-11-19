-- Threat: !InfrastructureShared
-- Name: 6f788043858e
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and mp.getfilesize() >= 112000 then
  return mp.INFECTED
end
return mp.CLEAN
