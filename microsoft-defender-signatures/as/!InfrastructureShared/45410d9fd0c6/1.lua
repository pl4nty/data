-- Threat: !InfrastructureShared
-- Name: 45410d9fd0c6
-- Type: 21

if mp.get_mpattribute("SIGATTR:Trojan:MSIL/BrLaunch.HA!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
