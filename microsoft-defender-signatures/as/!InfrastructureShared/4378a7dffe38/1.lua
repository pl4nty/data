-- Threat: !InfrastructureShared
-- Name: 4378a7dffe38
-- Type: 21

if mp.get_mpattribute("HSTR:Trojan:Win32/IsDelphi") then
  return mp.INFECTED
end
return mp.CLEAN
