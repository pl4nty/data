-- Threat: !InfrastructureShared
-- Name: 39618059551a
-- Type: 21

if mp.getfilesize() < 10000 and peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
