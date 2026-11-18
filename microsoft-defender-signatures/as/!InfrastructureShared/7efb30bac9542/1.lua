-- Threat: !InfrastructureShared
-- Name: 7efb30bac9542
-- Type: 21

local l_0_0 = mp.enum_mpattributesubstring("Behavior:Win32/BlockMpTamper")
local l_0_1 = mp.enum_mpattributesubstring("Behavior:Win32/ShadowCopyDelete")
local l_0_2 = mp.enum_mpattributesubstring("Behavior:Win32/RunsBcdedit")
local l_0_3 = mp.enum_mpattributesubstring("Behavior:Win32/StartupRepair")
local l_0_4 = mp.enum_mpattributesubstring("Behavior:Win32/FsutilUsnDeleteJournal")
if #l_0_2 == 0 and #l_0_3 == 0 and #l_0_4 == 0 and #l_0_0 == 0 and #l_0_1 == 0 then
  return mp.CLEAN
end
local l_0_5, l_0_6, l_0_7, l_0_8, l_0_9
local l_0_10 = {}
local l_0_11, l_0_12, l_0_13, l_0_14, l_0_15
local l_0_16 = {
  [".gif"] = true,
  [".pdf"] = true,
  [".doc"] = true,
  [".docx"] = true,
  [".docm"] = true,
  [".xls"] = true,
  [".xlsx"] = true,
  [".xlsm"] = true,
  [".ppt"] = true,
  [".pptx"] = true,
  [".pptm"] = true,
  [".rtf"] = true,
  [".zip"] = true,
  [".rar"] = true,
  [".cab"] = true,
  [".jpg"] = true,
  [".jpeg"] = true,
  [".bmp"] = true,
  [".png"] = true,
  [".jpe"] = true,
  [".xml"] = true,
  [".wer"] = true,
  [".dat"] = true,
  [".tmp"] = true
}
if this_sigattrlog[7].matched and this_sigattrlog[7].wp1 ~= nil then
  l_0_5 = this_sigattrlog[7].utf8p1
  table.insert(l_0_10, this_sigattrlog[7].timestamp)
  l_0_11 = string.lower(string.sub(l_0_5, -5)):match("(%.%a+)$")
  if l_0_16[l_0_11] then
    return mp.CLEAN
  end
end
if this_sigattrlog[25].matched and this_sigattrlog[25].wp1 ~= nil then
  l_0_6 = this_sigattrlog[25].utf8p1
  table.insert(l_0_10, this_sigattrlog[25].timestamp)
  l_0_12 = string.lower(string.sub(l_0_6, -5)):match("(%.%a+)$")
  if l_0_16[l_0_12] then
    return mp.CLEAN
  end
end
if this_sigattrlog[43].matched and this_sigattrlog[43].wp1 ~= nil then
  l_0_7 = this_sigattrlog[43].utf8p1
  table.insert(l_0_10, this_sigattrlog[43].timestamp)
  l_0_13 = string.lower(string.sub(l_0_7, -5)):match("(%.%a+)$")
  if l_0_16[l_0_13] then
    return mp.CLEAN
  end
end
if this_sigattrlog[61].matched and this_sigattrlog[61].wp1 ~= nil then
  l_0_8 = this_sigattrlog[61].utf8p1
  table.insert(l_0_10, this_sigattrlog[61].timestamp)
  l_0_14 = string.lower(string.sub(l_0_8, -5)):match("(%.%a+)$")
  if l_0_16[l_0_14] then
    return mp.CLEAN
  end
end
if this_sigattrlog[79].matched and this_sigattrlog[79].wp1 ~= nil then
  l_0_9 = this_sigattrlog[79].utf8p1
  table.insert(l_0_10, this_sigattrlog[79].timestamp)
  l_0_15 = string.lower(string.sub(l_0_9, -5)):match("(%.%a+)$")
  if l_0_16[l_0_15] then
    return mp.CLEAN
  end
end
if l_0_11 ~= nil and l_0_11 == l_0_12 and l_0_11 == l_0_13 and l_0_11 == l_0_14 and l_0_11 == l_0_15 then
  table.sort(l_0_10)
  if l_0_10[#l_0_10] - l_0_10[1] < 5000000 then
    if mp.get_sigattr_event_count(16387) < 10 then
      return mp.CLEAN
    end
    if mp.get_sigattr_event_count(16384) < 20 then
      return mp.CLEAN
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
