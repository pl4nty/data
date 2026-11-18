-- Threat: !InfrastructureShared
-- Name: 1317804fda2f4
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
