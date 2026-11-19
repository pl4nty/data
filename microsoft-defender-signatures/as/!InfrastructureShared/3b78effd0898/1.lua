-- Threat: !InfrastructureShared
-- Name: 3b78effd0898
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and mp.getfilesize() > 850000 then
  return mp.INFECTED
end
return mp.CLEAN
