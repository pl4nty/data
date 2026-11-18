-- Threat: !InfrastructureShared
-- Name: bf7867b234d7
-- Type: 21

if peattributes.isexe and mp.get_mpattribute("HSTR:Win32/DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
