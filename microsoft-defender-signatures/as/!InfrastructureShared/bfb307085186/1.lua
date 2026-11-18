-- Threat: !InfrastructureShared
-- Name: bfb307085186
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
end
if not isIEXfound(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = {
  "new-object system.net.http.httpclient",
  "downloadstring",
  "curl",
  "wget",
  "invoke-restmethod",
  "irm",
  "invoke-webrequest",
  "iwr",
  "invoke-command"
}
if not contains(l_0_0, l_0_1) then
  return mp.CLEAN
end
return mp.INFECTED
