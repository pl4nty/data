-- Threat: !InfrastructureShared
-- Name: 4d7839e3deeb
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and mp.getfilesize() < 229890 then
  return mp.INFECTED
end
return mp.CLEAN
