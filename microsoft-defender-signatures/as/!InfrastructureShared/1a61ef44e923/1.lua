-- Threat: !InfrastructureShared
-- Name: 1a61ef44e923
-- Type: 21

if mp.get_mpattribute("HSTR:Trojan:Win32/IsDelphi") then
  return mp.INFECTED
end
return mp.CLEAN
