-- Threat: !InfrastructureShared
-- Name: 72783c7cd5bd
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and mp.getfilesize() < 300000 then
  return mp.INFECTED
end
return mp.CLEAN
