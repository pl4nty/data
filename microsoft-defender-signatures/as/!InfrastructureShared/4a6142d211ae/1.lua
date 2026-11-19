-- Threat: !InfrastructureShared
-- Name: 4a6142d211ae
-- Type: 21

if mp.get_mpattribute("HSTR:Trojan:Win32/IsDelphi") then
  return mp.INFECTED
end
return mp.CLEAN
