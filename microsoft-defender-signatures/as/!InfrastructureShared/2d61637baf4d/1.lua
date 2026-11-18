-- Threat: !InfrastructureShared
-- Name: 2d61637baf4d
-- Type: 21

if mp.get_mpattribute("pea_isexe") and mp.get_mpattribute("HSTR:Win32/DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
