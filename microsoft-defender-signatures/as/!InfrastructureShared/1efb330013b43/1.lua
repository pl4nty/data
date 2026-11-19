-- Threat: !InfrastructureShared
-- Name: 1efb330013b43
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0
local l_0_1 = 0
local l_0_2
local l_0_3 = {}
local l_0_4 = 0

function addExtensionToList(l_1_0)
  local l_1_1
  l_1_1 = string.match(l_1_0, "(%.[^%.]+)$")
  if l_1_1 ~= nil and l_1_1 ~= "" and string.find(l_1_1, "/", 1, true) == nil and GetExtensionClassEx(l_1_1, true) == 0 and IsExtensionDatePattern(l_1_1) == false then
    if l_0_3[l_1_1] ~= nil then
      if not IsStringInTable(l_0_3[l_1_1], l_1_0) then
        table.insert(l_0_3[l_1_1], l_1_0)
      end
    else
      l_0_3[l_1_1] = {l_1_0}
      l_0_4 = l_0_4 + 1
    end
  end
end

if bm.GetSignatureMatchDuration() > 100000000 then
  return mp.CLEAN
end
local l_0_5 = bm.get_imagepath():lower()
if l_0_5 ~= nil and IsExcludedByImagePath(l_0_5) then
  return mp.CLEAN
end
if this_sigattrlog[7].matched and this_sigattrlog[7].wp1 ~= nil and this_sigattrlog[7].wp2 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[7].utf8p1)
  addExtensionToList(l_0_2)
  l_0_2 = nil
end
if this_sigattrlog[8].matched and this_sigattrlog[8].wp1 ~= nil and this_sigattrlog[8].wp2 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[8].utf8p1)
  addExtensionToList(l_0_2)
  l_0_2 = nil
end
if this_sigattrlog[9].matched and this_sigattrlog[9].wp1 ~= nil and this_sigattrlog[9].wp2 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[9].utf8p1)
  addExtensionToList(l_0_2)
  l_0_2 = nil
end
if this_sigattrlog[10].matched and this_sigattrlog[10].wp1 ~= nil and this_sigattrlog[10].wp2 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[10].utf8p1)
  addExtensionToList(l_0_2)
  l_0_2 = nil
end
if this_sigattrlog[11].matched and this_sigattrlog[11].wp1 ~= nil and this_sigattrlog[11].wp2 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[11].utf8p1)
  addExtensionToList(l_0_2)
  l_0_2 = nil
end
if this_sigattrlog[12].matched and this_sigattrlog[12].wp1 ~= nil and this_sigattrlog[12].wp2 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[12].utf8p1)
  addExtensionToList(l_0_2)
  l_0_2 = nil
end
if this_sigattrlog[13].matched and this_sigattrlog[13].wp1 ~= nil and this_sigattrlog[13].wp2 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[13].utf8p1)
  addExtensionToList(l_0_2)
  l_0_2 = nil
end
if this_sigattrlog[14].matched and this_sigattrlog[14].wp1 ~= nil and this_sigattrlog[14].wp2 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[14].utf8p1)
  addExtensionToList(l_0_2)
  l_0_2 = nil
end
if this_sigattrlog[15].matched and this_sigattrlog[15].wp1 ~= nil and this_sigattrlog[15].wp2 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[15].utf8p1)
  addExtensionToList(l_0_2)
  l_0_2 = nil
end
if this_sigattrlog[16].matched and this_sigattrlog[16].wp1 ~= nil and this_sigattrlog[16].wp2 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[16].utf8p1)
  addExtensionToList(l_0_2)
  l_0_2 = nil
end
if 3 < l_0_4 then
  return mp.CLEAN
end
for l_0_6, l_0_7 in pairs(l_0_3) do
  if l_0_0 == nil or l_0_1 < #l_0_7 then
    l_0_0 = l_0_6
    l_0_1 = #l_0_7
  end
end
if l_0_1 < 8 then
  return mp.CLEAN
end
local l_0_8 = bm.get_current_process_startup_info()
if l_0_8 ~= nil then
  l_0_8 = l_0_8.ppid
else
  l_0_8 = "-1"
end
if IsExcludedByImagePathFileExtension(l_0_5, l_0_0) or IsExcludedByImagePathFileExtensionRegEx(l_0_5, l_0_0) or isParentPackageManager(l_0_8, true) then
  return mp.CLEAN
end
bm.add_related_string("ransom_extension", l_0_0, bm.RelatedStringBMReport)
local l_0_9 = "gene_linux_ransom_meta"
local l_0_10 = {}
AppendToRollingQueue(l_0_9, "cur_image_path", l_0_5)
AppendToRollingQueue(l_0_9, "proc_info", l_0_8)
AppendToRollingQueue(l_0_9, "appended_ext", l_0_0)
for l_0_11, l_0_12 in pairs(l_0_3[l_0_0]) do
  bm.add_related_file(l_0_12)
  table.insert(l_0_10, l_0_12)
end
AppendToRollingQueue(l_0_9, "renamed_file_path", table.concat(l_0_10, ","))
addRelatedProcess()
reportRelatedBmHits()
bm.trigger_sig("GenericLinuxRansomware", "Type6")
return mp.INFECTED
