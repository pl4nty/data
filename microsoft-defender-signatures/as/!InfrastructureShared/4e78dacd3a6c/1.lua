-- Threat: !InfrastructureShared
-- Name: 4e78dacd3a6c
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  mp.set_mpattribute("ChangeEPtoExport")
end
return mp.INFECTED
