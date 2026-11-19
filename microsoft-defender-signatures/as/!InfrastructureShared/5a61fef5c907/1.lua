-- Threat: !InfrastructureShared
-- Name: 5a61fef5c907
-- Type: 21

if mp.get_mpattribute("HSTR:Trojan:Win32/IsDelphi") then
  return mp.INFECTED
end
return mp.CLEAN
