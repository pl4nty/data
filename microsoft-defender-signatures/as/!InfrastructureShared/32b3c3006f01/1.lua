-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3c3006f01\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
  local l_0_0 = (this_sigattrlog[1]).utf8p2
  local l_0_1, l_0_2 = (string.match)(l_0_0, "(.*)|(.*)")
  if not l_0_1 or not l_0_2 then
    return mp.CLEAN
  end
  l_0_1 = (string.lower)(l_0_1)
  l_0_2 = (string.lower)(l_0_2)
  local l_0_3 = l_0_2:match("^(.*)\\")
  local l_0_4 = l_0_2:match("([^\\]+)$")
  local l_0_5 = l_0_1:match("([^\\]+)$")
  local l_0_6 = {}
  l_0_6.Dll_Path = l_0_2
  local l_0_7, l_0_8 = IsKeyValuePairInRollingQueue("ArchivesWithExec_FileName", l_0_4, l_0_3, false)
  local l_0_9, l_0_10 = IsKeyValuePairInRollingQueue("ArchivesWithExec_FileName", l_0_5, l_0_3, false)
  if l_0_7 and l_0_9 then
    l_0_6.DllAndExecInArchive = true
    l_0_6.Archive_Exe = l_0_10
    l_0_6.Archive_Dll = l_0_8
  end
  local l_0_11, l_0_12 = pcall(MpCommon.RollingQueueQueryKeyRegex, "RQ_RecentExecDropped", l_0_2)
  if l_0_11 and l_0_12 then
    l_0_6.FileDropperInfo = l_0_12
  end
  local l_0_13 = IsKeyInRollingQueue("SYSTEM_DLLs", l_0_4)
  -- DECOMPILER ERROR at PC84: Unhandled construct in 'MakeBoolean' P1

  if l_0_13 and l_0_13 ~= "NONE" then
    l_0_6.POTENTIAL_SIDE_LOADING = l_0_13
  end
  do
    local l_0_14 = "NONE"
    if (sysio.IsFileExists)("c:\\Windows\\System32\\" .. l_0_4) then
      l_0_14 = "System32"
      l_0_6.POTENTIAL_SIDE_LOADING = "System32"
    else
      if (sysio.IsFileExists)("c:\\Windows\\SysWOW64\\" .. l_0_4) then
        l_0_14 = "SysWOW64"
        l_0_6.POTENTIAL_SIDE_LOADING = "SysWOW64"
      end
    end
    AppendToRollingQueue("SYSTEM_DLLs", l_0_4, l_0_14, 31104000, 1000)
    local l_0_15 = safeJsonSerialize(l_0_6, 100, nil, true)
    local l_0_16 = bm.add_related_string
    local l_0_17 = "Additional_Info"
    do
      l_0_16(l_0_17, l_0_15 or "", bm.RelatedStringBMReport)
      l_0_16 = bm
      l_0_16 = l_0_16.add_related_file
      l_0_17 = l_0_2
      l_0_16(l_0_17)
      -- DECOMPILER ERROR at PC134: freeLocal<0 in 'ReleaseLocals'

      return mp.INFECTED
    end
  end
end

