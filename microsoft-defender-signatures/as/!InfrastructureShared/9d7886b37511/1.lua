-- Threat: !InfrastructureShared
-- Name: 9d7886b37511
-- Type: 21

if peattributes.hasexports == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
