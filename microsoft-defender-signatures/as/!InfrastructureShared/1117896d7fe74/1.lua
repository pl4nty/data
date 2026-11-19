-- Threat: !InfrastructureShared
-- Name: 1117896d7fe74
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and mp.getfilesize() < 400000 then
  return mp.INFECTED
end
return mp.CLEAN
