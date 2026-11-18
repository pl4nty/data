-- Threat: !InfrastructureShared
-- Name: 8178fcec8480
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
