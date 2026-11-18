-- Threat: !InfrastructureShared
-- Name: 247ff7017912
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  mp.set_mpattribute("ChangeEPtoExport")
end
return mp.CLEAN
