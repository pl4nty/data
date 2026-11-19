-- Threat: !InfrastructureShared
-- Name: 5b78055b914b
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() > 950000 and mp.getfilesize() < 990000 and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
