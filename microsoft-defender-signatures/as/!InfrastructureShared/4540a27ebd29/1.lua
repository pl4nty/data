-- Threat: !InfrastructureShared
-- Name: 4540a27ebd29
-- Type: 21

if mp.get_mpattribute("SIGATTR:FirewallBypassList") then
  return mp.INFECTED
end
return mp.CLEAN
