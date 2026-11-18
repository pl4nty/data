-- Threat: !InfrastructureShared
-- Name: 113784b958899
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
