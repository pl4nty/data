-- Threat: !InfrastructureShared
-- Name: 8e78127a08cf
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and mp.getfilesize() < 2000000 then
  return mp.INFECTED
end
return mp.CLEAN
