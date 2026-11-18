-- Threat: !InfrastructureShared
-- Name: 1e78c147c128
-- Type: 21

if mp.get_mpattribute("HSTR:Trojan:Win32/IsDelphi") then
  return mp.INFECTED
end
return mp.CLEAN
