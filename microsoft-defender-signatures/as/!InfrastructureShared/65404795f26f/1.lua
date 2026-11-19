-- Threat: !InfrastructureShared
-- Name: 65404795f26f
-- Type: 21

if mp.get_mpattribute("SIGATTR:FirewallBypassList") then
  return mp.INFECTED
end
return mp.CLEAN
