-- Threat: !InfrastructureShared
-- Name: 196785380bdd4
-- Type: 21

if mp.get_mpattribute("HSTR:Win32/DelphiFile") and peattributes.isexe == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
