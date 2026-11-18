-- Threat: !InfrastructureShared
-- Name: 1c78e87a3b9c
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("HSTR:Win32/DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
