-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\fdb33dac0332\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = (MpCommon.PathToWin32Path)(l_0_0)
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0)
if isKnownCleanPathContext(l_0_1) then
  return mp.CLEAN
end
if (string.find)(l_0_1, "\\appdata\\local\\microsoft\\onedrive\\", 1, true) and (StringEndsWith(l_0_1, "\\filesyncconfig.exe") or StringEndsWith(l_0_1, "\\onedrive.sync.service.exe") or StringEndsWith(l_0_1, "\\filecoauth.exe") or StringEndsWith(l_0_1, "\\microsoft.sharepoint.exe")) then
  return mp.CLEAN
end
if StringEndsWith(l_0_1, "\\dismhost.exe") and (string.find)(l_0_1, ":\\$windows.~bt\\work\\", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_1, "\\packages\\plugins\\microsoft.azure.geneva.genevamonitoring\\", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_1, "\\programdata\\microsoft\\microsoft defender\\defender update\\platform\\", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_1, "\\programdata\\cyvera\\localsystem\\python\\", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_1, "\\programdata\\microsoft\\windows defender\\platform\\", 1, true) and (StringEndsWith(l_0_1, "\\mipdlp.exe") or StringEndsWith(l_0_1, "\\dlpuseragent.exe") or StringEndsWith(l_0_1, "\\mpdlpservice.exe") or StringEndsWith(l_0_1, "\\configsecuritypolicy.exe")) then
  return mp.CLEAN
end
if (string.find)(l_0_1, "\\appdata\\local\\anthropicclaude\\", 1, true) and StringEndsWith(l_0_1, "\\claude.exe") then
  return mp.CLEAN
end
if (string.find)(l_0_1, "\\appdata\\local\\microsoft\\edgeupdate\\", 1, true) and StringEndsWith(l_0_1, "\\microsoftedgeupdatecomregistershell64.exe") then
  return mp.CLEAN
end
local l_0_2 = nil
if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 ~= nil then
  l_0_2 = (this_sigattrlog[4]).utf8p1
end
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = (MpCommon.PathToWin32Path)(l_0_2)
if l_0_2 == nil then
  return mp.CLEAN
end
if checkFileLastWriteTime(l_0_2, 1800) == true then
  return mp.CLEAN
end
local l_0_3 = (mp.IsKnownFriendlyFile)(l_0_2, false, false)
if l_0_3 == true then
  return mp.CLEAN
end
if checkFileLastWriteTime(l_0_0, 1800) == true then
  return mp.CLEAN
end
local l_0_4 = (mp.IsKnownFriendlyFile)(l_0_0, true, true)
if not l_0_4 then
  return mp.CLEAN
end
;
(bm.add_related_file)(l_0_2)
;
(mp.ReportLowfi)(l_0_2, 2924828722)
local l_0_5 = (string.format)("loadedModule=%s", l_0_2)
;
(bm.add_related_string)("ReferencePath", l_0_5, bm.RelatedStringBMReport)
return mp.INFECTED

