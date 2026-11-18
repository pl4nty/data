-- Threat: !InfrastructureShared
-- Name: 3a782121f7fb
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true and mp.getfilesize() < 2097152 then
  return mp.INFECTED
end
return mp.CLEAN
