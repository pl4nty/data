-- Threat: !InfrastructureShared
-- Name: 417833b39719
-- Type: 21

if peattributes.hasexports == true and peattributes.isdll == false then
  return mp.INFECTED
end
return mp.CLEAN
