-- Threat: !InfrastructureShared
-- Name: 6578d6116102
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("HSTR:Trojan:Win32/IsDelphi") then
  return mp.INFECTED
end
return mp.CLEAN
