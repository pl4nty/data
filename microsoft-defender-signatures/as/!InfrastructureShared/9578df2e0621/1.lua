-- Threat: !InfrastructureShared
-- Name: 9578df2e0621
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
