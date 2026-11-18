-- Threat: !InfrastructureShared
-- Name: 7d78a7033306
-- Type: 21

if mp.get_mpattribute("pea_isexe") and mp.get_mpattribute("HSTR:Win32/DelphiFile") and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
