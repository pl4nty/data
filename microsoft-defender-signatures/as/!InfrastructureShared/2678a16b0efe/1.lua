-- Threat: !InfrastructureShared
-- Name: 2678a16b0efe
-- Type: 21

if peattributes.isdll and peattributes.checks_if_debugged_undocumented then
  return mp.INFECTED
end
return mp.CLEAN
