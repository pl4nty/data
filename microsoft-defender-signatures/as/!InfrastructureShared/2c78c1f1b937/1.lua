-- Threat: !InfrastructureShared
-- Name: 2c78c1f1b937
-- Type: 21

if mp.get_mpattribute("HSTR:Trojan:Win32/IsDelphi") then
  return mp.INFECTED
end
return mp.CLEAN
