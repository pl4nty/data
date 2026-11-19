-- Threat: !InfrastructureShared
-- Name: 1e619b4322b6
-- Type: 21

if mp.get_mpattribute("HSTR:Trojan:Win32/IsDelphi") then
  return mp.INFECTED
end
return mp.CLEAN
