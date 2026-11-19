-- Threat: !InfrastructureShared
-- Name: 11678cd1660d7
-- Type: 21

if mp.HSTR_WEIGHT >= 13 then
  return mp.INFECTED
end
if mp.HSTR_WEIGHT >= 12 then
  mp.set_mpattribute("HSTR:BrowserModifier:Win32/YahooSearch.C!Cby")
end
return mp.CLEAN
