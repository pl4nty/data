-- Threat: !InfrastructureShared
-- Name: 89787f66ee60
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and mp.get_mpattribute("Win32/PosDllHijack.1") then
  return mp.INFECTED
end
return mp.CLEAN
