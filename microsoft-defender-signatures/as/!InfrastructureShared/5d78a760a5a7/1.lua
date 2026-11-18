-- Threat: !InfrastructureShared
-- Name: 5d78a760a5a7
-- Type: 21

if mp.get_mpattribute("HSTR:Trojan:Win32/IsDelphi") and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
