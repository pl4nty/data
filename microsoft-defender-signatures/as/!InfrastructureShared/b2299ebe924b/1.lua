-- Threat: !InfrastructureShared
-- Name: b2299ebe924b
-- Type: 21

if mp.get_mpattribute("SCPT:HTML/SuspiciousRedirect") then
  return mp.INFECTED
end
return mp.CLEAN
