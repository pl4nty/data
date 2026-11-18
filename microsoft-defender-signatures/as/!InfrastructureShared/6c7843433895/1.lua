-- Threat: !InfrastructureShared
-- Name: 6c7843433895
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("HSTR:Trojan:Win32/IsDelphi") then
  return mp.INFECTED
end
return mp.CLEAN
