-- Threat: !InfrastructureShared
-- Name: 3978982c91d4
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
