-- Threat: !InfrastructureShared
-- Name: 96bb31a3ccf3c
-- Type: 21

local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4
local l_0_5 = {}
local l_0_6, l_0_7, l_0_8, l_0_9, l_0_10
local l_0_11 = {
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
  [".dat"] = true
}
if this_sigattrlog[26].matched and this_sigattrlog[26].wp1 ~= nil then
  l_0_0 = this_sigattrlog[26].utf8p1
  table.insert(l_0_5, this_sigattrlog[26].timestamp)
  l_0_6 = string.lower(string.sub(l_0_0, -5)):match("(%.%a+)$")
  if l_0_11[l_0_6] then
    return mp.CLEAN
  end
end
if this_sigattrlog[48].matched and this_sigattrlog[48].wp1 ~= nil then
  l_0_1 = this_sigattrlog[48].utf8p1
  table.insert(l_0_5, this_sigattrlog[48].timestamp)
  l_0_7 = string.lower(string.sub(l_0_1, -5)):match("(%.%a+)$")
  if l_0_11[l_0_7] then
    return mp.CLEAN
  end
end
if this_sigattrlog[70].matched and this_sigattrlog[70].wp1 ~= nil then
  l_0_2 = this_sigattrlog[70].utf8p1
  table.insert(l_0_5, this_sigattrlog[70].timestamp)
  l_0_8 = string.lower(string.sub(l_0_2, -5)):match("(%.%a+)$")
  if l_0_11[l_0_8] then
    return mp.CLEAN
  end
end
if this_sigattrlog[92].matched and this_sigattrlog[92].wp1 ~= nil then
  l_0_3 = this_sigattrlog[92].utf8p1
  table.insert(l_0_5, this_sigattrlog[92].timestamp)
  l_0_9 = string.lower(string.sub(l_0_3, -5)):match("(%.%a+)$")
  if l_0_11[l_0_9] then
    return mp.CLEAN
  end
end
if this_sigattrlog[114].matched and this_sigattrlog[114].wp1 ~= nil then
  l_0_4 = this_sigattrlog[114].utf8p1
  table.insert(l_0_5, this_sigattrlog[114].timestamp)
  l_0_10 = string.lower(string.sub(l_0_4, -5)):match("(%.%a+)$")
  if l_0_11[l_0_10] then
    return mp.CLEAN
  end
end
if l_0_6 ~= nil and l_0_6 == l_0_7 and l_0_6 == l_0_8 and l_0_6 == l_0_9 and l_0_6 == l_0_10 then
  table.sort(l_0_5)
  if l_0_5[#l_0_5] - l_0_5[1] < 5000000 then
    if mp.get_sigattr_event_count(16386) < 10 then
      return mp.CLEAN
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
