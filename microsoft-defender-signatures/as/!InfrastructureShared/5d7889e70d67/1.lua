-- Threat: !InfrastructureShared
-- Name: 5d7889e70d67
-- Type: 21

if peattributes.ismsil and peattributes.no_security and mp.getfilesize() < 5000 then
  return mp.INFECTED
end
return mp.CLEAN
