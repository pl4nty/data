-- Threat: !InfrastructureShared
-- Name: 103b3bfc3c225
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 then
  l_0_0 = this_sigattrlog[6].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0)
local l_0_2 = {
  "invoke-expression",
  "iex(",
  "iex ",
  "|iex",
  "| iex",
  ";iex",
  "invoke-webrequest",
  "iwr ",
  "invoke-restmethod",
  "irm ",
  "downloadstring",
  "downloadfile",
  "downloaddata",
  "net.webclient",
  "webclient).download",
  "system.net",
  "frombase64string",
  "-w hidden",
  "-windowstyle hidden",
  "-windowstyle h"
}
if not contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = string.find(l_0_1, "http://", 1, true) or string.find(l_0_1, "https://", 1, true)
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = string.len(l_0_1)
if l_0_4 < 60 or 4096 < l_0_4 then
  return mp.CLEAN
end
bm.add_related_string("SuspW3Wp", tostring(l_0_1), bm.RelatedStringBMReport)
return mp.INFECTED
