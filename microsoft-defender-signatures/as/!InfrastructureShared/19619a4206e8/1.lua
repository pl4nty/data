-- Threat: !InfrastructureShared
-- Name: 19619a4206e8
-- Type: 21

if mp.get_mpattribute("HSTR:Trojan:Win32/IsDelphi") then
  return mp.INFECTED
end
return mp.CLEAN
