-- Threat: !InfrastructureShared
-- Name: 4b78d5b74acc
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 3000000 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
