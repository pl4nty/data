-- Threat: !InfrastructureShared
-- Name: !#Lua:PeExtractedFileInArchive.A
-- Type: 8
-- MpAttributes: MpOnOpenOrCloseRtpScan

local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
if l_0_0 == nil or string.len(l_0_0) < 22 or string.find(l_0_0, "\\appdata\\local\\temp\\", 1, true) == nil then
  return mp.CLEAN
end
local l_0_1 = string.match(l_0_0, "\\appdata\\local\\temp\\(.+)")
if l_0_1 == nil or string.len(l_0_1) < 4 then
  return mp.CLEAN
end
if string.find(l_0_1, "\\", 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_2 = {
  zip = "temp%x_.+%.zip",
  rar = "rar$.+",
  ["7zip"] = "7z.+",
  wzip = "wz.+"
}
for l_0_3, l_0_4 in pairs(l_0_2) do
  if string.match(l_0_1, l_0_4) ~= nil then
    mp.set_mpattribute("Lua:PeExtractedFileInArchive.A!" .. l_0_3)
    return mp.INFECTED
  end
end
return mp.CLEAN
