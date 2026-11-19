-- Threat: !InfrastructureShared
-- Name: 4a781d3c6ba7
-- Type: 21

if not mp.get_mpattribute("do_exhaustivehstr_64bit_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_64bit_rescan")
end
if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
