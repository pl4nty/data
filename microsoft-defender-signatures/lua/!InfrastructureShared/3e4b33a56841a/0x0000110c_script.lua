-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3e4b33a56841a\0x0000110c_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[15]).matched and (this_sigattrlog[15]).utf8p1 ~= nil then
    local l_0_0 = nil
  end
  local l_0_1 = nil
  if (bm.get_imagepath)() == nil then
    return mp.CLEAN
  end
  if l_0_1 == nil then
    return mp.CLEAN
  end
  if (MpCommon.PathToWin32Path)((bm.get_imagepath)()) == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R1 in 'UnsetPending'

  if l_0_1 == (string.lower)((MpCommon.PathToWin32Path)((bm.get_imagepath)())) then
    return mp.CLEAN
  end
  if StringEndsWith(l_0_1, ".exe") then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC62: Confused about usage of register: R1 in 'UnsetPending'

  if not (mp.IsKnownFriendlyFile)((string.lower)((MpCommon.PathToWin32Path)((bm.get_imagepath)())), true, true) then
    return mp.CLEAN
  end
  if (mp.IsKnownFriendlyFile)(l_0_1, true, true) then
    return mp.CLEAN
  end
  local l_0_2, l_0_3 = , nil
  local l_0_4, l_0_5 = nil, (mp.GetMotwHostUrlForFile)(l_0_1)
  local l_0_6, l_0_7 = , (mp.GetMotwHostUrlForFile)(l_0_2)
  local l_0_8, l_0_9 = , (mp.GetMotwReferrerUrlForFile)(l_0_1)
  local l_0_10, l_0_11 = , (mp.GetMotwReferrerUrlForFile)(l_0_2)
  local l_0_12, l_0_13 = , (mp.GetMotwZoneForFile)(l_0_1)
  local l_0_14, l_0_15 = , (mp.GetMotwZoneForFile)(l_0_2)
  do
    local l_0_16 = nil
    do
      local l_0_17 = nil
      if not l_0_10 or l_0_12 then
        local l_0_18 = nil
        do
          ;
          (bm.add_related_string)("PotentialSideLoad_info", safeJsonSerialize({dll_motw = l_0_6 or "", proc_motw = l_0_8 or "", dll_zone = l_0_14 or "", proc_zone = l_0_18 or "", procPath = l_0_2 or "", dllPath = l_0_1 or "", proc_refUrl = l_0_12 or "", dll_refUrl = l_0_10 or "", dll_friendly = (mp.IsKnownFriendlyFile)(l_0_1, true, false) or "" or "", exe_friendly = (mp.IsKnownFriendlyFile)(l_0_2, true, false) or "" or "", dll_motw_refer = l_0_3 or "", proc_motw_refer = l_0_4 or ""}), bm.RelatedStringBMReport)
          -- DECOMPILER ERROR at PC203: Confused about usage of register: R18 in 'UnsetPending'

          ;
          (bm.trigger_sig)("PotentialSideLoad", tostring(safeJsonSerialize({dll_motw = l_0_6 or "", proc_motw = l_0_8 or "", dll_zone = l_0_14 or "", proc_zone = l_0_18 or "", procPath = l_0_2 or "", dllPath = l_0_1 or "", proc_refUrl = l_0_12 or "", dll_refUrl = l_0_10 or "", dll_friendly = (mp.IsKnownFriendlyFile)(l_0_1, true, false) or "" or "", exe_friendly = (mp.IsKnownFriendlyFile)(l_0_2, true, false) or "" or "", dll_motw_refer = l_0_3 or "", proc_motw_refer = l_0_4 or ""})))
          if (sysio.IsFileExists)(l_0_1) then
            (mp.ReportLowfi)(l_0_1, 263154785)
            ;
            (bm.add_related_file)(l_0_1)
          end
          do return mp.INFECTED end
          -- DECOMPILER ERROR at PC224: freeLocal<0 in 'ReleaseLocals'

        end
      end
    end
  end
end

