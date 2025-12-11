-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b35b1ceefc\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
  (bm.add_related_string)("Evidence", (this_sigattrlog[1]).utf8p2, bm.RelatedStringBMReport)
  local l_0_0 = safeJsonDeserialize((this_sigattrlog[1]).utf8p2)
  if not l_0_0 then
    return mp.CLEAN
  end
  local l_0_1 = {}
  -- DECOMPILER ERROR at PC35: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC36: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC37: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC38: Overwrote pending register: R4 in 'AssignReg'

  if ("onedrivestandaloneupdater.exe")("OneDrive.exe", "gup.exe") then
    if l_0_0.Dll_Path then
      (bm.add_threat_file)(l_0_0.Dll_Path)
    end
    local l_0_2, l_0_3 = pcall(reportBmInfo)
    -- DECOMPILER ERROR at PC58: Overwrote pending register: R5 in 'AssignReg'

    -- DECOMPILER ERROR at PC59: Overwrote pending register: R6 in 'AssignReg'

    if not l_0_2 and l_0_3 then
      (bm.add_related_string)("WinHex.exe", ("EBWebView.exe")(l_0_3), bm.RelatedStringBMReport)
    end
    return mp.INFECTED
  end
  do
    local l_0_4 = (bm.get_imagepath)()
    if not l_0_4 then
      return mp.CLEAN
    end
    local l_0_5 = (MpCommon.GetOriginalFileName)(l_0_4)
    do
      if not l_0_5 then
        local l_0_6 = (sysio.GetPEVersionInfo)(l_0_4)
        if l_0_6 and l_0_6.OriginalFilename then
          l_0_5 = l_0_6.OriginalFilename .. tostring(l_0_6.FileDescription)
        end
      end
      local l_0_7 = {}
      -- DECOMPILER ERROR at PC99: No list found for R4 , SetList fails

      -- DECOMPILER ERROR at PC102: Overwrote pending register: R5 in 'AssignReg'

      -- DECOMPILER ERROR at PC103: Overwrote pending register: R6 in 'AssignReg'

      if l_0_5 and ("update.exetrend")((("vpnserver.*softether").lower)(l_0_5), l_0_7, false) then
        if l_0_0.Dll_Path then
          (bm.add_threat_file)(l_0_0.Dll_Path)
        end
        local l_0_8, l_0_9 = pcall(reportBmInfo)
        if not l_0_8 and l_0_9 then
          (bm.add_related_string)("bmInfoFailReason", tostring(l_0_9), bm.RelatedStringBMReport)
        end
        return mp.INFECTED
      end
      do
        return mp.CLEAN
      end
    end
  end
end

