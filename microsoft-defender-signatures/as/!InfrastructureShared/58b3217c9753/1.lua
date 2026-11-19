-- Threat: !InfrastructureShared
-- Name: 58b3217c9753
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = this_sigattrlog[1]
if l_0_0 == nil or l_0_0.matched ~= true or l_0_0.utf8p1 == nil or l_0_0.utf8p2 == nil then
  return mp.CLEAN
end
local l_0_1 = ExtractPartsFromUri(tostring(l_0_0.utf8p1))
local l_0_2 = string.lower(tostring(l_0_1.host or ""))
l_0_2 = string.gsub(l_0_2, "%.$", "")
if not string.match(l_0_2, "%.monster$") or l_0_1.path ~= "" or l_0_1.query == nil or l_0_1.query == "" then
  return mp.CLEAN
end
local l_0_3 = string.lower(tostring(l_0_0.utf8p2))
local l_0_4 = {
  "iex",
  "invoke-expression",
  "invoke-webrequest",
  "invoke-restmethod",
  "iwr ",
  "irm ",
  "downloadstring",
  "start-process",
  "-executionpolicy bypass",
  "-ep bypass",
  "-w hidden",
  "-windowstyle hidden"
}
if not contains(l_0_3, l_0_4) then
  return mp.CLEAN
end
return mp.INFECTED
