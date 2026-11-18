-- Threat: !InfrastructureShared
-- Name: b478df1f1827
-- Type: 21

if mp.get_mpattribute("pea_isexe") and mp.get_mpattribute("HSTR:Win32/DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
