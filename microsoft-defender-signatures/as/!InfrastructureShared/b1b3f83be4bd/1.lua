-- Threat: !InfrastructureShared
-- Name: b1b3f83be4bd
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4
local l_0_5 = 2
if this_sigattrlog[7].matched and this_sigattrlog[7].p2 then
  l_0_0 = this_sigattrlog[7].utf8p1:lower()
  l_0_1 = this_sigattrlog[7].ppid
  l_0_2 = this_sigattrlog[7].image_path
  l_0_3 = 1
else
  return mp.CLEAN
end
if l_0_2 == nil or l_0_1 == nil then
  return mp.CLEAN
end
l_0_4 = string.match(l_0_2, "\\([^\\]+)$")
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_6 = bm.get_current_process_startup_info()
local l_0_7 = l_0_6.ppid
local l_0_8 = l_0_6.command_line
if l_0_6 == nil or l_0_7 == nil or l_0_8 == nil then
  return mp.CLEAN
end
local l_0_9 = l_0_3 .. "|" .. l_0_1 .. "|" .. l_0_2
local l_0_10 = "OfficeGen" .. l_0_7
local l_0_11 = 3600
local l_0_12 = 10
AppendToRollingQueue(l_0_10, l_0_0, l_0_9, l_0_11, l_0_12, 0)
local l_0_13 = bm_AddRelatedFileFromCommandLine(l_0_8)
local l_0_14 = GetRollingQueue(l_0_10)
if l_0_14 == nil or type(l_0_14) ~= "table" then
  return mp.CLEAN
end
local l_0_15 = {
  doc = l_0_13,
  cmd = l_0_8,
  detectionLog = {}
}
local l_0_16
l_0_3 = 0
for l_0_17, l_0_18 in ipairs(l_0_14) do
  l_0_16 = explode(l_0_18.value, "|")
  table.insert(l_0_15.detectionLog, {
    name = l_0_18.key,
    ppid = l_0_16[2],
    timestamp = l_0_18.insert_time,
    file = l_0_16[3]
  })
  l_0_3 = l_0_3 + l_0_16[1]
end
if l_0_5 <= l_0_3 then
  bm.add_related_string("officegen", safeJsonSerialize(l_0_15), bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
