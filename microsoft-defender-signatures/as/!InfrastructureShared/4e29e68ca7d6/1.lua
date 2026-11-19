-- Threat: !InfrastructureShared
-- Name: 4e29e68ca7d6
-- Type: 21

if mp.get_mpattribute("SCPT:HTML/SuspiciousRedirect") then
  return mp.INFECTED
end
return mp.CLEAN
