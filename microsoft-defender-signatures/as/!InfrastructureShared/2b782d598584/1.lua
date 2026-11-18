-- Threat: !InfrastructureShared
-- Name: 2b782d598584
-- Type: 21

if mp.get_mpattribute("HSTR:Trojan:Win32/IsDelphi") then
  return mp.INFECTED
end
return mp.CLEAN
