-- Threat: !InfrastructureShared
-- Name: 617827c551f5
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
