-- Threat: !InfrastructureShared
-- Name: a2787f96cc67
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
