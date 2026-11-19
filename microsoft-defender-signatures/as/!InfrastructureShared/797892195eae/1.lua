-- Threat: !InfrastructureShared
-- Name: 797892195eae
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and mp.getfilesize() < 7340032 and mp.getfilesize() > 5242880 then
  return mp.INFECTED
end
return mp.CLEAN
