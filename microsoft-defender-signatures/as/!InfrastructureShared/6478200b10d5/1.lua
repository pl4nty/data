-- Threat: !InfrastructureShared
-- Name: 6478200b10d5
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 3 and peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
if not mp.get_mpattribute("do_exhaustivehstr_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
  pe.reemulate()
  return mp.CLEAN
end
return mp.CLEAN
