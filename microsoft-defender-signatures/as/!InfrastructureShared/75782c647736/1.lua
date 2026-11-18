-- Threat: !InfrastructureShared
-- Name: 75782c647736
-- Type: 21

if mp.get_mpattribute("CERT:Trojan:Win32/Mansabo.RPX1!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
