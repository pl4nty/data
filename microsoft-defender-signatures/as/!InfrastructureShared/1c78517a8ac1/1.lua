-- Threat: !InfrastructureShared
-- Name: 1c78517a8ac1
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("HSTR:Win32/DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
