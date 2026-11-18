-- Threat: !InfrastructureShared
-- Name: 5178a9a16187
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
