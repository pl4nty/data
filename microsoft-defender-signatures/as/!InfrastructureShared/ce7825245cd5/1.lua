-- Threat: !InfrastructureShared
-- Name: ce7825245cd5
-- Type: 21

if peattributes.isexe and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
