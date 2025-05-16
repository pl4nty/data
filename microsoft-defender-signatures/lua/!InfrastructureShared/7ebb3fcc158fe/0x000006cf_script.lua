-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\7ebb3fcc158fe\0x000006cf_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC6: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[18]).matched then
    local l_0_0, l_0_1, l_0_2 = nil
  end
  if (this_sigattrlog[19]).matched then
    local l_0_3, l_0_4 = , (string.match)((this_sigattrlog[19]).utf8p1, "imagename:(.+);targetprocessppid:(%d+):")
    if (this_sigattrlog[19]).utf8p1 == nil then
      return mp.CLEAN
    end
    local l_0_5 = nil
    if (bm.get_imagepath)() == nil then
      return mp.CLEAN
    end
    local l_0_6 = nil
    if (string.lower)((MpCommon.PathToWin32Path)((bm.get_imagepath)())) == nil then
      return mp.CLEAN
    end
    local l_0_7 = nil
    ;
    (bm.add_related_process)((mp.GetPPidFromPid)(l_0_5))
    if (sysio.IsFileExists)(l_0_7) and not (mp.IsKnownFriendlyFile)(l_0_7, true, false) then
      (bm.add_related_file)(l_0_7)
      ;
      (bm.add_related_string)("SUSPICIOUS PATH: ", l_0_4, bm.RelatedStringBMReport)
      ;
      (bm.request_SMS)((mp.GetPPidFromPid)(l_0_5), "h+")
      ;
      (bm.add_action)("SmsAsyncScanEvent", 1)
      AppendToRollingQueue("AMSIpatch", "Amsi", "1", 86400)
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end

