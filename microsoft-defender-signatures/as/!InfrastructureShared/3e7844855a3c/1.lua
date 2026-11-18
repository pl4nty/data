-- Threat: !InfrastructureShared
-- Name: 3e7844855a3c
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("HSTR:Trojan:Win32/IsDelphi") then
  return mp.INFECTED
end
return mp.CLEAN
