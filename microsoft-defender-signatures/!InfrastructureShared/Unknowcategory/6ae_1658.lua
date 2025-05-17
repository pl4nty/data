-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6ae_1658.luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((bm.get_imagepath)())
if l_0_0 and ((string.find)(l_0_0, "outlook.exe", 1, true) or (string.find)(l_0_0, "mssense.exe", 1, true) or (string.find)(l_0_0, "excel.exe", 1, true) or (string.find)(l_0_0, "searchprotocolhost.exe", 1, true)) then
  return mp.CLEAN
end
local l_0_1 = (bm.get_current_process_startup_info)()
if l_0_1.integrity_level == MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
  return mp.CLEAN
end
local l_0_2 = (MpCommon.GetProcessElevationAndIntegrityLevel)(l_0_1.ppid)
if l_0_2.IntegrityLevel == MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
  return mp.CLEAN
end
local l_0_3, l_0_4, l_0_5, l_0_6 = nil, nil, nil, nil
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil then
  l_0_3 = (this_sigattrlog[1]).utf8p1
end
if l_0_3 == nil then
  return mp.CLEAN
end
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil then
  l_0_4 = (this_sigattrlog[2]).utf8p1
end
if l_0_4 == nil then
  return mp.CLEAN
end
if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 ~= nil then
  l_0_5 = (this_sigattrlog[3]).utf8p1
end
if l_0_5 == nil then
  return mp.CLEAN
end
if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 ~= nil then
  l_0_6 = (this_sigattrlog[4]).utf8p1
end
if l_0_6 == nil then
  return mp.CLEAN
end
if (string.find)(l_0_3, "\\windows\\", 1, true) or (string.find)(l_0_3, "\\programdata\\usoshared\\logs\\system\\", 1, true) or (string.find)(l_0_4, "\\windows\\", 1, true) or (string.find)(l_0_4, "\\programdata\\usoshared\\logs\\system\\", 1, true) or (string.find)(l_0_5, "\\windows\\", 1, true) or (string.find)(l_0_5, "\\programdata\\usoshared\\logs\\system\\", 1, true) or (string.find)(l_0_6, "\\windows\\", 1, true) or (string.find)(l_0_6, "\\programdata\\usoshared\\logs\\system\\", 1, true) then
  return mp.CLEAN
end
;
(bm.add_related_string)("SuspETLAccessA", tostring(l_0_3), bm.RelatedStringBMReport)
;
(bm.add_related_string)("SuspETLAccessA", tostring(l_0_4), bm.RelatedStringBMReport)
;
(bm.add_related_string)("SuspETLAccessA", tostring(l_0_5), bm.RelatedStringBMReport)
;
(bm.add_related_string)("SuspETLAccessA", tostring(l_0_6), bm.RelatedStringBMReport)
return mp.INFECTED

