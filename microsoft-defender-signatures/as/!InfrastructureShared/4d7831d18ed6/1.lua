-- Threat: !InfrastructureShared
-- Name: 4d7831d18ed6
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and mp.getfilesize() < 1048576 and mp.getfilesize() > 819200 then
  return mp.INFECTED
end
return mp.CLEAN
