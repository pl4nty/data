-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/SuspMMCFile.A
-- Type: 13
-- Includes: ResearchData, LuaFuncHelper, AppomalyHelpers
-- MpAttributes: (SCPT:MMC_ConsoleFile & BM_XML_FILE) | Lua:IsDotNetAMSIScan_MMC

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 1048576 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename()
l_0_1 = l_0_1 and MpCommon.PathToWin32Path(l_0_1)
if not l_0_1 then
  _, l_0_1 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
end
local l_0_2 = l_0_1 or ""
local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME) or ""
local l_0_4
if 1024 < l_0_0 then
  mp.readprotection(false)
  l_0_4 = mp.readfile(0, l_0_0)
else
  l_0_4 = tostring(headerpage) .. tostring(footerpage)
end
if not l_0_4 then
  return mp.CLEAN
end
l_0_4 = string.match(l_0_4, "<StringTables>(.-)</StringTable>")
if not l_0_4 then
  return mp.CLEAN
end
local l_0_5 = "<String ID=.->({%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x})</String"
local l_0_6 = l_0_4:match(l_0_5)
if l_0_6 then
  local l_0_7 = l_0_6 .. ";" .. l_0_2 .. ";" .. l_0_3
  AppendToRollingQueue("MMC_SnapInCLSID", "SnapInCLSID", string.lower(l_0_7), 1800, 100, 0)
  set_research_data("CLSID", MpCommon.Base64Encode(l_0_7), false)
end
local l_0_8 = "<String ID=.->(http.-)</String"
local l_0_9 = l_0_4:match(l_0_8)
if l_0_9 then
  local l_0_10 = l_0_9 .. ";" .. l_0_2 .. ";" .. l_0_3
  local l_0_11, l_0_12 = UrlGrader(l_0_9, "Trojan:Win32/SuspMMCFile.A", false)
  if l_0_11 ~= 0 then
    local l_0_13 = safeJsonSerialize(l_0_12)
    set_research_data("URL_info", MpCommon.Base64Encode(l_0_13), false)
    l_0_10 = l_0_10 .. ";URL_Grading_Info=" .. l_0_13
  end
  AppendToRollingQueue("MMC_SnapInUrls", "SnapInUrls", string.lower(l_0_10), 1800, 100, 0)
  set_research_data("URL", MpCommon.Base64Encode(l_0_9), false)
end
if l_0_6 or l_0_9 then
  return mp.INFECTED
end
return mp.CLEAN
