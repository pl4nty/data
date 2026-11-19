-- Threat: !InfrastructureShared
-- Name: !#BM_OfficeFilesFromArchives
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: MpOnCloseNewlyCreatedHintRtpScan & (Lua:FileInZip | Lua:FileIn7z | Lua:FileInRar | Lua:FileInTarGzip | Lua:FileInIso | Lua:FileInTar) & !LUA:FileSizeGT4M.A

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_1 == nil or #l_0_1 < 4 then
  return mp.CLEAN
end
local l_0_2 = l_0_1:match("%.([^%.]+)$")
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = {
  xlsx = true,
  xls = true,
  xlsm = true,
  xlsb = true,
  xlt = true,
  xltx = true,
  xltm = true,
  xlam = true,
  xla = true,
  docx = true,
  doc = true,
  docm = true,
  dotm = true,
  dotx = true,
  ppam = true,
  pptm = true,
  ppsm = true,
  potm = true,
  ppt = true,
  pptx = true,
  rtf = true,
  one = true,
  [".onetoc2"] = true
}
local l_0_4 = {
  iso = true,
  vhd = true,
  vhdx = true,
  ppkg = true,
  sppkg = true,
  img = true
}
local l_0_5
if l_0_4[l_0_2] then
  l_0_5 = "iso|"
elseif l_0_3[l_0_2] then
  if mp.get_mpattribute("MHSTR:MacroInside") then
    l_0_5 = "office|HasMacros|"
  end
else
  return mp.CLEAN
end
local l_0_6 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
local l_0_7 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
l_0_6 = MpCommon.PathToWin32Path(l_0_6)
if l_0_6 == nil or l_0_7 == nil then
  return mp.CLEAN
end
l_0_6 = l_0_6:lower()
local l_0_8, l_0_9, l_0_10
local l_0_11 = ";"
local l_0_12 = 0
while l_0_12 <= 5 do
  l_0_8, l_0_9 = pcall(mp.GetParentProcInfo, l_0_7)
  if l_0_8 ~= true or l_0_9 == nil or l_0_9.ppid == nil or l_0_9.image_path == nil then
    break
  end
  l_0_7 = l_0_9.ppid
  l_0_10 = string.lower(l_0_9.image_path)
  l_0_11 = l_0_11 .. "Parent_" .. l_0_12 .. "Path=" .. l_0_10 .. ";pid=" .. l_0_7 .. ";"
  l_0_12 = l_0_12 + 1
end
local l_0_13 = MpCommon.GetCurrentTimeT()
local l_0_14 = 31536000
local l_0_15 = l_0_0 .. "\\" .. l_0_1
local l_0_16 = "OFFAR::ProcessImagePath=" .. l_0_6 .. ";pid=" .. l_0_7 .. ";timestamp=" .. l_0_13 .. l_0_11
if l_0_5 ~= nil then
  l_0_16 = l_0_16 .. ";extra=" .. l_0_5
end
if not IsKeyInRollingQueue("CC_filelist", l_0_15) then
  AppendToRollingQueue("CC_filelist", l_0_15, l_0_16, l_0_14, 32)
  mp.set_mpattribute(string.format("MpInternal_researchdata=CC_Research=%s", l_0_16))
end
return mp.INFECTED
