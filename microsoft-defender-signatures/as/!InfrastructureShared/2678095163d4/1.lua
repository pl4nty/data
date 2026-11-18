-- Threat: !InfrastructureShared
-- Name: 2678095163d4
-- Type: 21

if mp.get_mpattribute("HSTR:Trojan:Win32/Lazy.HAU!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
