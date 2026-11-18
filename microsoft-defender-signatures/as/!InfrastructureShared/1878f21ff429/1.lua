-- Threat: !InfrastructureShared
-- Name: 1878f21ff429
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("HSTR:Win32/DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
