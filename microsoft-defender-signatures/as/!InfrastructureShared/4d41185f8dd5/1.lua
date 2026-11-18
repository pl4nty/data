-- Threat: !InfrastructureShared
-- Name: 4d41185f8dd5
-- Type: 21

local l_0_0 = nri.GetRawRequestBlob()
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = {
  php = true,
  php3 = true,
  php4 = true,
  php5 = true,
  php7 = true,
  php8 = true,
  phtml = true,
  phar = true,
  inc = true,
  jsp = true,
  jspx = true,
  asp = true,
  aspx = true
}
local l_0_2 = false
for l_0_3 in string.gmatch(l_0_0, "filename=\"([^\"\r\n]+)\"") do
  local l_0_4 = string.match(l_0_3, "([^/\\]+)$")
  local l_0_5 = l_0_4 and string.match(l_0_4, "%.([a-z0-9]+)$")
  local l_0_7 = l_0_4 and (string.find(l_0_4, "artx_", 1, true) == 1 or string.find(l_0_4, "artx-", 1, true) == 1 or string.match(l_0_4, "^zzartx%d+%.") ~= nil)
  if l_0_7 and l_0_1[l_0_5] then
    l_0_2 = true
  end
end
if not l_0_2 then
  return mp.CLEAN
end
nri.AddTelemetry(nri.Telemetry_HOSTNAME, {
  stage = "labelled-script-upload"
})
return mp.INFECTED
