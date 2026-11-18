-- Threat: !InfrastructureShared
-- Name: 14778a718374a
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  mp.set_mpattribute("ChangeEPtoExport")
  mp.set_mpattribute("HSTR:TrojanProxy:Win32/Bunitu.F")
  return mp.LOWFI
end
return mp.CLEAN
