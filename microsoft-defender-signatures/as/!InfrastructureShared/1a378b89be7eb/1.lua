-- Threat: !InfrastructureShared
-- Name: 1a378b89be7eb
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 3140000 then
  return mp.INFECTED
end
return mp.CLEAN
