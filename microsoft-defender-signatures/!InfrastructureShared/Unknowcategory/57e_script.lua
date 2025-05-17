-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\57e_luac 

-- params : ...
-- function num : 0
local l_0_0 = ""
if (this_sigattrlog[16]).matched and (this_sigattrlog[16]).utf8p1 ~= nil then
  l_0_0 = (MpCommon.PathToWin32Path)((string.lower)((this_sigattrlog[16]).utf8p1))
end
if l_0_0 == nil then
  return mp.CLEAN
end
if (mp.IsKnownFriendlyFile)(l_0_0, true, false) then
  return mp.CLEAN
end
;
(bm.add_related_string)("SuspModuleLoadG_DLL", tostring(l_0_0), bm.RelatedStringBMReport)
local l_0_1 = (bm.get_current_process_startup_info)()
if l_0_1 then
  (bm.add_related_string)("SuspModuleLoadG_startInfo", tostring(l_0_1.integrity_level), bm.RelatedStringBMReport)
end
if not (this_sigattrlog[1]).ppid then
  return mp.CLEAN
end
local l_0_2 = (MpCommon.GetProcessElevationAndIntegrityLevel)((this_sigattrlog[1]).ppid)
if l_0_2 then
  (bm.add_related_string)("SuspModuleLoadG_crtInfo", tostring(l_0_2.IntegrityLevel), bm.RelatedStringBMReport)
end
return mp.INFECTED

