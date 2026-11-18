-- Threat: !InfrastructureShared
-- Name: !#SLF:IsPotentialSideLoad.A
-- Type: 10
-- Includes: LuaFuncHelper, TechniqueTracker, Path

if mp.get_mpattribute("Exclusion:IsPotentialSideLoad.A") == true then
  return mp.CLEAN
end
if not peattributes.isdll then
  return mp.CLEAN
end
if peattributes.isappcontainer or peattributes.resource_only_dll or peattributes.no_ep or peattributes.dmg_entrypoint or peattributes.dmg_not_executable_image or peattributes.dmg_truncated then
  return mp.CLEAN
end
local l_0_0 = mp.GetCertificateInfo()
for l_0_1, l_0_2 in pairs(l_0_0) do
  if l_0_2.Signers ~= nil then
    return mp.CLEAN
  end
end
local l_0_3, l_0_4 = pcall(mp.get_parent_filehandle)
if l_0_3 then
  l_0_3, _ = pcall(mp.get_filesize_by_handle, l_0_4)
  if l_0_3 then
    return mp.CLEAN
  end
end
local l_0_5 = normalize_path(mp.getfilename())
if not l_0_5 then
  return mp.CLEAN
end
l_0_5 = string.lower(l_0_5)
if string.sub(l_0_5, 1, 1) ~= "c" then
  return mp.CLEAN
end
if string.find(l_0_5, "program files", 1, true) ~= nil or string.find(l_0_5, "c:\\windows\\system32\\", 1, true) ~= nil or string.find(l_0_5, "c:\\windows\\syswow64\\", 1, true) ~= nil or string.find(l_0_5, "windows\\winsxs", 1, true) ~= nil or string.find(l_0_5, "c:\\$windows.~bt\\", 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_6 = string.lower(mp.getfilename(mp.FILEPATH_QUERY_FNAME))
if l_0_6 == nil or string.len(l_0_6) > 23 then
  return mp.CLEAN
end
local l_0_7 = isFilenameInSideLoadIndicators(l_0_6)
if l_0_7 and l_0_5 then
  mp.set_mpattribute("BM_IsPotentialSideLoad")
  MpCommon.SetOriginalFileName(l_0_5, "BM_IsPotentialSideLoad")
  local l_0_8 = "IsPotentialSideLoad"
  AppendToRollingQueue(l_0_8, l_0_5)
end
if l_0_7 == mp.INFECTED then
  return mp.INFECTED
elseif l_0_7 == mp.LOWFI then
  return mp.LOWFI
end
return mp.CLEAN
