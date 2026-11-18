-- Threat: !InfrastructureShared
-- Name: 366b3e2e73929
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, TechniqueTracker

local l_0_0, l_0_1
local l_0_2 = 0
local l_0_3 = 0
if this_sigattrlog[18].matched and this_sigattrlog[18].utf8p2 then
  l_0_0 = this_sigattrlog[18].utf8p2
end
if not l_0_0 then
  return mp.CLEAN
end
if l_0_0 == "" then
  return mp.CLEAN
end
if not StringStartsWith(l_0_0, ".") then
  return mp.CLEAN
end
local l_0_4 = {
  ".tmp",
  ".temp",
  ".rename",
  ".nm!",
  ".bin",
  ".~mt",
  ".~tmp"
}
if contains(l_0_0, l_0_4) then
  return mp.CLEAN
end
if string.match(l_0_0, "%.d+$") then
  return mp.CLEAN
end
if string.len(l_0_0) < 4 or IsExtensionDatePattern(l_0_0) == true or string.match(l_0_0, "%d+.%d+.%d+") or string.match(l_0_0, "%.%w+%.%w+$") then
  return mp.CLEAN
end
if mp.bitand(mp.GetExtensionClass(l_0_0), 3) ~= 0 then
  return mp.CLEAN
end
if this_sigattrlog[19].matched and this_sigattrlog[19].utf8p2 then
  l_0_1 = this_sigattrlog[19].utf8p2
elseif this_sigattrlog[20].matched and this_sigattrlog[20].utf8p2 then
  l_0_1 = this_sigattrlog[20].utf8p2
end
if not l_0_1 then
  return mp.CLEAN
end
local l_0_5 = safeJsonDeserialize(l_0_1)
if not l_0_5 then
  return mp.CLEAN
end
local l_0_6 = {
  [".7z"] = true,
  [".accdb"] = true,
  [".accde"] = true,
  [".avi"] = true,
  [".bmp"] = true,
  [".cmd"] = true,
  [".csv"] = true,
  [".dbf"] = true,
  [".doc"] = true,
  [".docb"] = true,
  [".docm"] = true,
  [".docx"] = true,
  [".dot"] = true,
  [".dotm"] = true,
  [".dotx"] = true,
  [".dwg"] = true,
  [".dws"] = true,
  [".dxf"] = true,
  [".email"] = true,
  [".eml"] = true,
  [".gif"] = true,
  [".gpg"] = true,
  [".gz"] = true,
  [".hsf"] = true,
  [".htm"] = true,
  [".html"] = true,
  [".igs"] = true,
  [".jpg"] = true,
  [".jpeg"] = true,
  [".json"] = true,
  [".kdb"] = true,
  [".kdbx"] = true,
  [".lnk"] = true,
  [".mdb"] = true,
  [".mp3"] = true,
  [".mp4"] = true,
  [".mpeg"] = true,
  [".mpg"] = true,
  [".msg"] = true,
  [".ost"] = true,
  [".png"] = true,
  [".pdf"] = true,
  [".pgp"] = true,
  [".pos"] = true,
  [".potm"] = true,
  [".potx"] = true,
  [".ppam"] = true,
  [".pps"] = true,
  [".ppsx"] = true,
  [".ppt"] = true,
  [".pptm"] = true,
  [".pptx"] = true,
  [".pst"] = true,
  [".rar"] = true,
  [".shp"] = true,
  [".shx"] = true,
  [".skp"] = true,
  [".sql"] = true,
  [".tlg"] = true,
  [".tsv"] = true,
  [".txt"] = true,
  [".vcf"] = true,
  [".vsd"] = true,
  [".vsdm"] = true,
  [".xlam"] = true,
  [".xlm"] = true,
  [".xls"] = true,
  [".xlsb"] = true,
  [".xlsm"] = true,
  [".xlsx"] = true,
  [".xlt"] = true,
  [".xltm"] = true,
  [".xltx"] = true,
  [".xlw"] = true,
  [".xml"] = true,
  [".yaml"] = true,
  [".yml"] = true,
  [".zip"] = true,
  [".exe"] = true
}
local l_0_7 = l_0_5.file_list
if isnull(l_0_7) then
  return mp.CLEAN
end
local l_0_8 = {}
for l_0_9 = 1, #l_0_7 do
  if l_0_9 % 2 == 0 then
    table.insert(l_0_8, l_0_7[l_0_9])
  end
end
for l_0_10, l_0_11 in pairs(l_0_8) do
  if StringStartsWith(l_0_11, "\\\\") then
    l_0_3 = l_0_3 + 1
  end
  if l_0_6[string.lower(l_0_11:match("(%.[^.]+)$"))] then
    l_0_2 = l_0_2 + 1
  end
end
if 5 <= l_0_3 then
  bm.trigger_sig("GenRansom_SD_RemotePath", safeJsonSerialize(l_0_5))
end
if 5 <= l_0_2 then
  bm.set_detection_string(safeJsonSerialize(l_0_5))
  return mp.INFECTED
end
return mp.CLEAN
