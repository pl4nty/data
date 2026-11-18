-- Threat: !InfrastructureShared
-- Name: 8978c49c53a8
-- Type: 21

if peattributes.epoutofimage == true and peattributes.hasexports == true and peattributes.no_security == true and peattributes.no_ep == true then
  return mp.INFECTED
end
return mp.CLEAN
