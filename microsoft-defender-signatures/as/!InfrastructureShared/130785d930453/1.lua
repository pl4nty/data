-- Threat: !InfrastructureShared
-- Name: 130785d930453
-- Type: 21
-- Flags: 1

if peattributes.isdll and peattributes.hasexports then
  mp.set_mpattribute("attrmatch_rescan_notiexplore")
  if mp.HSTR_WEIGHT >= 5 then
    return mp.INFECTED
  end
end
return mp.CLEAN
