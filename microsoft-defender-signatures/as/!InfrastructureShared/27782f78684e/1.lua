-- Threat: !InfrastructureShared
-- Name: 27782f78684e
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
