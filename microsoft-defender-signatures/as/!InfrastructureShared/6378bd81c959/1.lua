-- Threat: !InfrastructureShared
-- Name: 6378bd81c959
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 1000000 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
