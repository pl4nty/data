-- Threat: !InfrastructureShared
-- Name: 366175e73b45
-- Type: 21

if mp.get_mpattribute("HSTR:Trojan:Win32/IsDelphi") then
  return mp.INFECTED
end
return mp.CLEAN
