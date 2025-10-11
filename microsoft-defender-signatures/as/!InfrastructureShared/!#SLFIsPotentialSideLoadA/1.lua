-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFIsPotentialSideLoadA\1.luac 

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
local l_0_0 = (mp.GetCertificateInfo)()
for l_0_4,l_0_5 in pairs(l_0_0) do
  if l_0_5.Signers ~= nil then
    return mp.CLEAN
  end
end
local l_0_6, l_0_7 = pcall(mp.get_parent_filehandle)
if l_0_6 then
  l_0_6 = pcall(mp.get_filesize_by_handle, l_0_7)
  if l_0_6 then
    return mp.CLEAN
  end
end
local l_0_8 = (MpCommon.PathToWin32Path)((mp.getfilename)())
if not l_0_8 then
  return mp.CLEAN
end
l_0_8 = (string.lower)(l_0_8)
if (string.sub)(l_0_8, 1, 1) ~= "c" then
  return mp.CLEAN
end
if (string.find)(l_0_8, "program files", 1, true) ~= nil or (string.find)(l_0_8, "c:\\windows\\system32\\", 1, true) ~= nil or (string.find)(l_0_8, "c:\\windows\\syswow64\\", 1, true) ~= nil or (string.find)(l_0_8, "windows\\winsxs", 1, true) ~= nil or (string.find)(l_0_8, "c:\\$windows.~bt\\", 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_9 = (string.lower)((mp.getfilename)(mp.FILEPATH_QUERY_FNAME))
if l_0_9 == nil or (string.len)(l_0_9) > 20 then
  return mp.CLEAN
end
local l_0_10 = (mp.getfilesize)()
if l_0_10 < 256 or l_0_10 > 1048576 then
  return mp.CLEAN
end
local l_0_11 = isFilenameInSideLoadIndicators(l_0_9)
if l_0_11 and l_0_8 then
  (mp.set_mpattribute)("BM_IsPotentialSideLoad")
  ;
  (MpCommon.SetOriginalFileName)(l_0_8, "BM_IsPotentialSideLoad")
  local l_0_12 = "IsPotentialSideLoad"
  AppendToRollingQueue(l_0_12, l_0_8)
end
do
  if l_0_11 == mp.INFECTED then
    return mp.INFECTED
  else
    if l_0_11 == mp.LOWFI then
      return mp.LOWFI
    end
  end
  return mp.CLEAN
end

