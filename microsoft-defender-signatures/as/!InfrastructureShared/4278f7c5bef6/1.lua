-- Threat: !InfrastructureShared
-- Name: 4278f7c5bef6
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
