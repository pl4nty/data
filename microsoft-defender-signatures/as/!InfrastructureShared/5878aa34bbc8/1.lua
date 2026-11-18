-- Threat: !InfrastructureShared
-- Name: 5878aa34bbc8
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
