-- Threat: !InfrastructureShared
-- Name: 5278b08bbbfa
-- Type: 21

if mp.get_mpattribute("HSTR:Trojan:Win32/IsDelphi") then
  return mp.INFECTED
end
return mp.CLEAN
