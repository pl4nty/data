-- Threat: !InfrastructureShared
-- Name: 6a782dc96357
-- Type: 21

if peattributes.epoutofimage == true and peattributes.hasexports == true and peattributes.no_security == true and peattributes.no_ep == true then
  return mp.INFECTED
end
return mp.CLEAN
