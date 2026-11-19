-- Threat: !InfrastructureShared
-- Name: 807861e8fdac
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and mp.get_mpattribute("MpNewlyCreatedHint") == true then
  return mp.INFECTED
end
return mp.CLEAN
