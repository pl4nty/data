-- Threat: !InfrastructureShared
-- Name: !#Lua:OfficeExtractedFileInZip.A
-- Type: 12
-- MpAttributes: MpOnOpenOrCloseRtpScan

local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
if l_0_0 == nil or string.len(l_0_0) < 22 or string.find(l_0_0, "\\appdata\\local\\temp\\", 1, true) == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
if l_0_1 == nil or string.len(l_0_1) < 5 then
  return mp.CLEAN
end
local l_0_2 = string.sub(l_0_1, -4)
if l_0_2 == nil or string.len(l_0_2) < 4 then
  return mp.CLEAN
end
local l_0_3 = {
  [".xls"] = "excel",
  xlsx = "excel",
  xlsm = "excel",
  xlsb = "excel",
  xltx = "excel",
  xltm = "excel",
  [".xlt"] = "excel",
  xlam = "excel",
  [".xla"] = "excel",
  [".doc"] = "word",
  docx = "word",
  docm = "word",
  dotx = "word",
  dotm = "word",
  [".rtf"] = "word",
  [".ppt"] = "powerpoint",
  pptm = "powerpoint",
  [".pps"] = "powerpoint",
  pptx = "powerpoint",
  ppsx = "powerpoint",
  [".odt"] = "odt",
  [".xml"] = "xml"
}
if l_0_3[l_0_2] == nil then
  return mp.CLEAN
end
local l_0_4 = string.match(l_0_0, "\\appdata\\local\\temp\\(.+)")
if l_0_4 == nil or string.len(l_0_4) < 4 then
  return mp.CLEAN
end
if string.find(l_0_4, "\\", 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_5 = {
  zip = "temp%x_.+%.zip",
  rar = "rar$.+",
  ["7zip"] = "7z.+",
  wzip = "wz.+"
}
local l_0_6 = l_0_3[l_0_2]
for l_0_7, l_0_8 in pairs(l_0_5) do
  if string.match(l_0_4, l_0_8) ~= nil then
    mp.set_mpattribute("Lua:OfficeExtractedFileInZip.A!" .. l_0_7 .. "_" .. l_0_6)
    return mp.INFECTED
  end
end
return mp.CLEAN
