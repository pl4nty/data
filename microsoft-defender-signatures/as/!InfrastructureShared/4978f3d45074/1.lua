-- Threat: !InfrastructureShared
-- Name: 4978f3d45074
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and mp.getfilesize() < 2000000 then
  return mp.INFECTED
end
return mp.CLEAN
