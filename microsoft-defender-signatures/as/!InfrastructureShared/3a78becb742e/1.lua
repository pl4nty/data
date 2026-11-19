-- Threat: !InfrastructureShared
-- Name: 3a78becb742e
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 3 and peattributes.hasexports then
  return mp.SUSPICIOUS
end
if mp.HSTR_WEIGHT >= 2 and peattributes.hasexports then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.CLEAN
