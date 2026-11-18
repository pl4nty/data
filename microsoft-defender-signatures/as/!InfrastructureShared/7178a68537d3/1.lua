-- Threat: !InfrastructureShared
-- Name: 7178a68537d3
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
