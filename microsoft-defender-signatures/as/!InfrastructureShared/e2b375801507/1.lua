-- Threat: !InfrastructureShared
-- Name: e2b375801507
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1]
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2]
end
if l_0_0 == nil or isnull(l_0_0.utf8p1) or isnull(l_0_0.utf8p2) then
  return mp.CLEAN
end
if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
local l_0_1, l_0_2 = string.match(l_0_0.utf8p1, "^(%d+):(%d+)$")
if isnull(l_0_1) or isnull(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = tonumber(l_0_1)
local l_0_4 = tonumber(l_0_2)
if l_0_3 == nil or l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = l_0_3 % 256
local l_0_6 = l_0_4 % 256
if l_0_5 ~= 16 and l_0_5 ~= 32 then
  return mp.CLEAN
end
if l_0_6 ~= 4 and l_0_6 ~= 8 and l_0_6 ~= 64 and l_0_6 ~= 128 then
  return mp.CLEAN
end
local l_0_7, l_0_8 = string.match(string.lower(l_0_0.utf8p2), "^%d+;regionsize:(%d+);vavadmmfname:(.+)$")
if isnull(l_0_7) or isnull(l_0_8) then
  return mp.CLEAN
end
if string.match(l_0_8, "([^\\]+)$") ~= "ntdll.dll" then
  return mp.CLEAN
end
local l_0_9 = "x64"
if string.find(l_0_8, "\\syswow64\\", 1, true) then
  l_0_9 = "x86"
end
local l_0_10 = bm.get_imagepath()
if isnull(l_0_10) then
  return mp.CLEAN
end
local l_0_11 = string.match(string.lower(l_0_10), "([^\\]+)$")
if isnull(l_0_11) then
  return mp.CLEAN
end
local l_0_12 = mp.SIGATTR_LOG_SZ
if l_0_12 == nil or l_0_12 == 0 then
  return mp.CLEAN
end
local l_0_13 = {
  {
    "sentinelone",
    "\\sentinelone\\"
  },
  {
    "deepinstinct",
    "deephookingassembly"
  },
  {
    "deepinstinct",
    "\\deep instinct\\"
  }
}
local l_0_14 = 24
local l_0_15 = {}
local l_0_16 = {}
local l_0_17 = 0
local l_0_18 = {}
local l_0_19 = {}

local function l_0_20(l_1_0)
  if l_1_0 == nil or l_1_0.attribute ~= 16404 or isnull(l_1_0.utf8p1) then
    return
  end
  local l_1_1 = string.lower(l_1_0.utf8p1)
  if l_0_15[l_1_1] then
    return
  end
  l_0_15[l_1_1] = true
  local l_1_2 = false
  for l_1_3, l_1_4 in ipairs(l_0_13) do
    if string.find(l_1_1, l_1_4[2], 1, true) then
      l_1_2 = true
      if not l_0_18[l_1_4[1]] then
        l_0_18[l_1_4[1]] = true
        l_0_19[#l_0_19 + 1] = l_1_4[1]
      end
    end
  end
  if not l_1_2 and string.find(l_1_1, "\\windows\\", 1, true) then
    return
  end
  if l_0_17 >= l_0_14 then
    return
  end
  local l_1_5 = string.gsub(l_1_1, "^\\device\\harddiskvolume%d+", "")
  l_1_5 = string.gsub(l_1_5, "^%a:", "")
  l_1_5 = string.gsub(l_1_5, "\\users\\[^\\]+\\", "\\users\\_\\")
  l_0_17 = l_0_17 + 1
  l_0_16[l_0_17] = string.sub(l_1_5, 1, 160)
end

for l_0_21 = 1, l_0_12 do
  l_0_20(sigattr_head[l_0_21])
  l_0_20(sigattr_tail[l_0_21])
end
local l_0_22 = {
  target = "ntdll.dll",
  arch = l_0_9,
  old_mask = l_0_3,
  new_mask = l_0_4,
  region_size = tonumber(l_0_7),
  host = l_0_11,
  vendors = table.concat(l_0_19, "|"),
  module_count = l_0_17,
  modules = table.concat(l_0_16, "|")
}
local l_0_23 = safeJsonSerialize(l_0_22)
if isnull(l_0_23) then
  return mp.CLEAN
end
bm.add_related_string("MmSecureProtectTelemetry", l_0_23, bm.RelatedStringBMReport)
bm.set_detection_string(l_0_23)
return mp.INFECTED
