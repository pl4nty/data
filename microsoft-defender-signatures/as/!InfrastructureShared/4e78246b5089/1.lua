-- Threat: !InfrastructureShared
-- Name: 4e78246b5089
-- Type: 21

if pehdr.TimeDateStamp >= 1424734844 then
  mp.set_mpattribute("HSTR:BrowserModifier:Win32/GoogleToolbarNotifier")
  return mp.CLEAN
end
return mp.INFECTED
