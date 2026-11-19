-- Threat: !InfrastructureShared
-- Name: aa7824f40b64
-- Type: 21

if mp.get_mpattribute("HSTR:Trojan:Win32/IsDelphi") then
  return mp.INFECTED
end
return mp.CLEAN
