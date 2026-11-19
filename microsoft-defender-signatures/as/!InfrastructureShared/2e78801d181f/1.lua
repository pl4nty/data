-- Threat: !InfrastructureShared
-- Name: 2e78801d181f
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
