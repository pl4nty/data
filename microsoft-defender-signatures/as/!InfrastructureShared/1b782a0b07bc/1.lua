-- Threat: !InfrastructureShared
-- Name: 1b782a0b07bc
-- Type: 21

if mp.get_mpattribute("HSTR:Trojan:Win32/IsDelphi") then
  return mp.INFECTED
end
return mp.CLEAN
