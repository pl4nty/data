-- Threat: !InfrastructureShared
-- Name: 30618e25a519
-- Type: 21

if mp.get_mpattribute("HSTR:Trojan:Win32/IsDelphi") then
  return mp.INFECTED
end
return mp.CLEAN
