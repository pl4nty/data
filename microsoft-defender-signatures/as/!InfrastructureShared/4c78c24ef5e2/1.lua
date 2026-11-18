-- Threat: !InfrastructureShared
-- Name: 4c78c24ef5e2
-- Type: 21

if mp.get_mpattribute("pea_isexe") and mp.get_mpattribute("HSTR:Win32/DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
