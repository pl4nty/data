-- Threat: !InfrastructureShared
-- Name: 39b30da62913
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if isnull(l_0_0) then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = {
  "invoke-expression",
  "downloadstring",
  "downloadfile",
  "frombase64string",
  "system.io.compression",
  "system.io.memorystream",
  "iex ",
  "iex(",
  "invoke-webrequest",
  "iwr ",
  "iwr("
}
if contains(l_0_0, l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN
