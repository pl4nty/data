-- Threat: !InfrastructureShared
-- Name: ad78753208a3
-- Type: 21

if mp.get_mpattribute("HSTR:Trojan:Win32/DarkMe.GC!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
