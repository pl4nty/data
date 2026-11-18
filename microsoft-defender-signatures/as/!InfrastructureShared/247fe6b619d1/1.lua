-- Threat: !InfrastructureShared
-- Name: 247fe6b619d1
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  mp.set_mpattribute("ChangeEPtoExport")
end
return mp.CLEAN
