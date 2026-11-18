-- Threat: !InfrastructureShared
-- Name: 6978a38c1a71
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
