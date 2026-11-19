-- Threat: !InfrastructureShared
-- Name: 20d78e640fa7e
-- Type: 21

if mp.get_mpattribute("HSTR:Win32/DelphiFile") and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
