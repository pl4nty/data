-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFIsPotentialSideLoadA!invalidsigned\1.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("Exclusion:IsPotentialSideLoad.A") == true then
  return mp.CLEAN
end
if not peattributes.isdll then
  return mp.CLEAN
end
if peattributes.isappcontainer or peattributes.resource_only_dll or peattributes.no_ep or peattributes.dmg_entrypoint or peattributes.dmg_not_executable_image or peattributes.dmg_truncated then
  return mp.CLEAN
end
local l_0_0, l_0_1 = pcall(mp.get_parent_filehandle)
if l_0_0 then
  l_0_0 = pcall(mp.get_filesize_by_handle, l_0_1)
  if l_0_0 then
    return mp.CLEAN
  end
end
local l_0_2 = (MpCommon.PathToWin32Path)((mp.getfilename)())
if not l_0_2 then
  return mp.CLEAN
end
l_0_2 = (string.lower)(l_0_2)
if (string.sub)(l_0_2, 1, 1) ~= "c" then
  return mp.CLEAN
end
if (string.find)(l_0_2, "program files", 1, true) ~= nil or (string.find)(l_0_2, "c:\\windows\\system32\\", 1, true) ~= nil or (string.find)(l_0_2, "c:\\windows\\syswow64\\", 1, true) ~= nil or (string.find)(l_0_2, "windows\\winsxs", 1, true) ~= nil or (string.find)(l_0_2, "c:\\$windows.~bt\\", 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_3 = (string.lower)((mp.getfilename)(mp.FILEPATH_QUERY_FNAME))
if l_0_3 == nil or (string.len)(l_0_3) > 20 then
  return mp.CLEAN
end
local l_0_4 = isFilenameInSideLoadIndicators(l_0_3)
if l_0_4 and l_0_2 then
  (mp.set_mpattribute)("BM_IsPotentialSideLoad_InvalidSigned")
  ;
  (MpCommon.SetOriginalFileName)(l_0_2, "BM_IsPotentialSideLoad_InvalidSigned")
  local l_0_5 = "IsPotentialSideLoad_InvalidSigned"
  AppendToRollingQueue(l_0_5, l_0_2)
end
do
  if l_0_4 == mp.INFECTED then
    return mp.INFECTED
  else
    if l_0_4 == mp.LOWFI then
      return mp.LOWFI
    end
  end
  return mp.CLEAN
end

