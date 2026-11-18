-- Threat: !InfrastructureShared
-- Name: 6978dbed1f92
-- Type: 21

if pehdr.TimeDateStamp < 1433874509 then
  mp.set_mpattribute("Lowfi:HSTR:BrowserModifier:Win32/AOLToolbarOld")
  return mp.CLEAN
end
return mp.INFECTED
