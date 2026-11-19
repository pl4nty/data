-- Threat: !InfrastructureShared
-- Name: 7540076f91f0
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
