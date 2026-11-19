-- Threat: !InfrastructureShared
-- Name: !#ALF:SuspLnkFile
-- Type: 13
-- MpAttributes: BM_LNK_FILE & (FILE_DEVICE_IS_MOUNTED | FILE_REMOVABLE_MEDIA | !RPF:TopLevelFile)

if mp.get_mpattribute("Lua:LNK_Settings!RunMinimized") and (mp.get_mpattribute("Lua:LastFolderCount!0") or mp.get_mpattribute("InArchiveFile") or mp.get_mpattribute("Lua:LNK_Settings!HasArguments") or mp.get_mpattribute("Lua:LNK_Settings!HasIconLocation")) then
  local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_0 == nil then
    return mp.CLEAN
  end
  local l_0_1, l_0_2 = pcall(mp.GetLnkInfo)
  if l_0_1 == false or l_0_2 == nil then
    return mp.CLEAN
  end
  local l_0_3 = l_0_2.Arguments or ""
  local l_0_4 = l_0_2.BasePath or ""
  local l_0_5 = l_0_2.RelativePath or ""
  local l_0_6 = l_0_2.IconLocation or ""
  local l_0_7 = l_0_2.IconIndex or ""
  local l_0_8 = l_0_2.IDLISTTarget or ""
  if (l_0_3 ~= "" or l_0_5 ~= "") and (l_0_7 ~= "" or l_0_6 ~= "") then
    local l_0_9 = MpCommon.GetMountedFileBackingFilePath(l_0_0) or ""
    local l_0_10 = string.format("path=%s;iconIndex=%s;iconLocation=%s;args=%s;relativePath=%s;absolutePath=%s;backing=%s;idtarget=%s", l_0_0, l_0_7, l_0_6, l_0_3, l_0_5, l_0_4, l_0_9, l_0_8)
    mp.set_mpattribute(string.format("MpInternal_researchdata=LnkData=%s", l_0_10))
    return mp.INFECTED
  end
end
return mp.CLEAN
