-- Threat: !InfrastructureShared
-- Name: !#GenericAllowlist
-- Type: 24

if mp.get_mpattributesubstring("AllowList:") or mp.get_mpattributesubstring("Allowlist:") then
  return mp.INFECTED
end
return mp.CLEAN
