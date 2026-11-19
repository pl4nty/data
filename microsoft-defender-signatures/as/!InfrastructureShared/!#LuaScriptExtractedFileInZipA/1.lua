-- Threat: !InfrastructureShared
-- Name: !#Lua:ScriptExtractedFileInZip.A
-- Type: 12
-- MpAttributes: (MpOnOpenOrCloseRtpScan | MpNewlyCreatedHint)

local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
if l_0_0 == nil or string.len(l_0_0) < 22 or string.find(l_0_0, "\\appdata\\local\\temp\\", 1, true) == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
if l_0_1 == nil or string.len(l_0_1) < 5 then
  return mp.CLEAN
end
local l_0_2 = string.sub(l_0_1, -3)
if l_0_2 == nil or string.len(l_0_2) < 3 then
  return mp.CLEAN
end
local l_0_3 = {
  [".js"] = true,
  jse = true,
  vbs = true,
  vbe = true,
  wsf = true,
  hta = true
}
if l_0_3[l_0_2] ~= true then
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
for l_0_6, l_0_7 in pairs(l_0_5) do
  if string.match(l_0_4, l_0_7) ~= nil then
    if l_0_2 == "hta" then
      mp.set_mpattribute("Lua:MshtaExtractedFileInZip.A!" .. l_0_6)
    else
      mp.set_mpattribute("Lua:ScriptExtractedFileInZip.A!" .. l_0_6)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
