-- Threat: !InfrastructureShared
-- Name: 2c78741713e8
-- Type: 21

if mp.get_mpattribute("HSTR:Trojan:Win32/IsDelphi") and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
