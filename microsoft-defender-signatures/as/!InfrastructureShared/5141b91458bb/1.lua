-- Threat: !InfrastructureShared
-- Name: 5141b91458bb
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[3].matched then
  if this_sigattrlog[3].utf8p1 ~= nil then
    l_0_0 = this_sigattrlog[3].utf8p1
  end
  if this_sigattrlog[3].np2 ~= nil then
    l_0_1 = this_sigattrlog[3].np2
  end
end
if not l_0_0 then
  return mp.CLEAN
end
if not l_0_1 then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if l_0_1 == 3 or l_0_1 == 0 then
  return mp.CLEAN
end
if l_0_0 == "customblocklist" then
  return mp.CLEAN
end
local l_0_2 = {
  useragent = nri.GetHttpRequestHeader("User-Agent"),
  SmartScreen_category = l_0_0,
  SmartScreen_determination = l_0_1
}
nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_2)
return mp.INFECTED
