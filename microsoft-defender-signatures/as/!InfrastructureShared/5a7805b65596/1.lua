-- Threat: !InfrastructureShared
-- Name: 5a7805b65596
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
