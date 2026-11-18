-- Threat: !InfrastructureShared
-- Name: c378eec3422e
-- Type: 21

if mp.get_mpattribute("HSTR:Trojan:Win32/IsDelphi") then
  return mp.INFECTED
end
return mp.CLEAN
