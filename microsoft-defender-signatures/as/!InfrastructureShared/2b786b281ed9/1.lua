-- Threat: !InfrastructureShared
-- Name: 2b786b281ed9
-- Type: 21

if peattributes.isexe and mp.get_mpattribute("HSTR:Win32/DelphiFile") and hstrlog[2].hitcount >= 3 then
  return mp.INFECTED
end
return mp.CLEAN
