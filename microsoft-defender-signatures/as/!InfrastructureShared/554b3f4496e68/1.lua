-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\554b3f4496e68\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC9: Overwrote pending register: R0 in 'AssignReg'

do
  if not isnull((this_sigattrlog[14]).utf8p1) then
    local l_0_0, l_0_1, l_0_2 = nil
  else
  end
  if not isnull((this_sigattrlog[15]).utf8p1) then
    do return mp.CLEAN end
    local l_0_3 = nil
    if isnull((MpCommon.PathToWin32Path)((this_sigattrlog[15]).utf8p1)) or not (string.find)((string.lower)((MpCommon.PathToWin32Path)((this_sigattrlog[15]).utf8p1)), "c:", 1, true) then
      return mp.CLEAN
    end
    local l_0_4 = nil
    if isnull(GetRollingQueueKeyValue("PotentialSideLoadExports", (string.lower)((MpCommon.PathToWin32Path)((this_sigattrlog[15]).utf8p1)))) then
      return mp.CLEAN
    end
    local l_0_5, l_0_6, l_0_7, l_0_8, l_0_9, l_0_10, l_0_11, l_0_12, l_0_13 = , (GetRollingQueueKeyValue("PotentialSideLoadExports", (string.lower)((MpCommon.PathToWin32Path)((this_sigattrlog[15]).utf8p1)))):match("ExpCount=(%d+)__FwdExpCount=(%d+)__LocalExpCount=(%d+)__ExpType=(.-)%.(.-)=(.-)__FwdExpNames=(.-)__LocalExpNames=(.-)__Size=(%d+)")
    if isnull(l_0_11) or l_0_11 == "FailedExtraction" then
      return mp.CLEAN
    end
    local l_0_14 = nil
    if ({["msvcp140.dll"] = true, ["msvcrt.dll"] = true, ["ucrtbase.dll"] = true, ["vcruntime140.dll"] = true, ["vcruntime140_1.dll"] = true})[(string.lower)(l_0_11)] then
      return mp.CLEAN
    end
    if (string.lower)(l_0_11) == "libomp.dll" and (string.find)((string.lower)(l_0_4), "libiomp5md.dll$") then
      return mp.CLEAN
    end
    local l_0_15 = nil
    if isnull((bm.get_imagepath)()) then
      return mp.CLEAN
    end
    if isnull((MpCommon.PathToWin32Path)((bm.get_imagepath)())) then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC138: Confused about usage of register: R13 in 'UnsetPending'

    -- DECOMPILER ERROR at PC148: Confused about usage of register: R13 in 'UnsetPending'

    if isnull((mp.ContextualExpandEnvironmentVariables)((MpCommon.PathToWin32Path)((bm.get_imagepath)()))) or not (mp.IsKnownFriendlyFile)((mp.ContextualExpandEnvironmentVariables)((MpCommon.PathToWin32Path)((bm.get_imagepath)())), true, false) then
      return mp.CLEAN
    end
    local l_0_16 = nil
    local l_0_17 = l_0_4:match("^(.+)\\")
    if not l_0_17 or not l_0_16:match("^(.+)\\") or not (string.find)((string.lower)(l_0_17), (string.lower)(l_0_16:match("^(.+)\\")), 1, true) then
      return mp.CLEAN
    end
    local l_0_18 = nil
    -- DECOMPILER ERROR at PC199: Overwrote pending register: R16 in 'AssignReg'

    -- DECOMPILER ERROR at PC204: Overwrote pending register: R16 in 'AssignReg'

    -- DECOMPILER ERROR at PC212: Confused about usage of register: R16 in 'UnsetPending'

    if ((string.find)(l_0_11, ":", 1, true) and isnull(nil)) or not (sysio.IsFileExists)(nil) then
      return mp.CLEAN
    end
    local l_0_19 = nil
    local l_0_20 = 900
    if isnull((MpCommon.GetCurrentTimeT)()) or (MpCommon.GetCurrentTimeT)() == 0 then
      return mp.CLEAN
    end
    local l_0_21 = nil
    if isnull((sysio.GetFileLastWriteTime)(l_0_16)) or (sysio.GetFileLastWriteTime)(l_0_16) == 0 then
      return mp.CLEAN
    end
    local l_0_22 = nil
    if isnull((sysio.GetFileLastWriteTime)(l_0_4)) or (sysio.GetFileLastWriteTime)(l_0_4) == 0 then
      return mp.CLEAN
    end
    if l_0_20 < l_0_21 - (sysio.GetFileLastWriteTime)(l_0_4) / 10000000 - 11644473600 then
      return mp.CLEAN
    end
    local l_0_23 = nil
    ;
    (bm.add_related_file)(l_0_4)
    ;
    (bm.add_related_file)(l_0_19)
    local l_0_28 = nil
    do
      local l_0_29 = (sysio.GetFileAttributes)(l_0_4) ~= 4294967295 and (mp.bitand)((sysio.GetFileAttributes)(l_0_4), 2) == 2
      ;
      (bm.add_related_string)("PotentialSideload_Metadata", safeJsonSerialize({Process = l_0_16, DLL = l_0_4, DLLHidden = l_0_29, ProcessCreateTime = l_0_22, DLLCreateTime = l_0_23, CurrentTime = l_0_21, DLLSize = l_0_14, FwdDLL = l_0_19, ExpCount = l_0_6, FwdExpCount = l_0_7, LocalExpCount = l_0_8, FwdType = l_0_9, FwdStatus = l_0_10, FwdExp = l_0_12, LocalExp = l_0_13}), bm.RelatedStringBMReport)
      do return mp.INFECTED end
      -- DECOMPILER ERROR: 1 unprocessed JMP targets
    end
  end
end

