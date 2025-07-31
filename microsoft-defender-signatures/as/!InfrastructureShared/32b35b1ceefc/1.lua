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
    return mp.INFECTED
  end
  local l_0_2 = (bm.get_imagepath)()
  if not l_0_2 then
    return mp.CLEAN
  end
  local l_0_3 = (MpCommon.GetOriginalFileName)(l_0_2)
  -- DECOMPILER ERROR at PC68: Overwrote pending register: R5 in 'AssignReg'

  do
    if not l_0_3 then
      local l_0_4 = (sysio.GetPEVersionInfo)("WinHex.exe")
      -- DECOMPILER ERROR at PC76: Overwrote pending register: R6 in 'AssignReg'

      if l_0_4 and l_0_4.OriginalFilename then
        l_0_3 = l_0_4.OriginalFilename .. ("EBWebView.exe")(l_0_4.FileDescription)
      end
    end
    do
      local l_0_5 = {}
      -- DECOMPILER ERROR at PC83: No list found for R4 , SetList fails

      -- DECOMPILER ERROR at PC86: Overwrote pending register: R5 in 'AssignReg'

      -- DECOMPILER ERROR at PC87: Overwrote pending register: R6 in 'AssignReg'

      if l_0_3 and ("update.exetrend")((("vpnserver.*softether").lower)(l_0_3), l_0_5, false) then
        if l_0_0.Dll_Path then
          (bm.add_threat_file)(l_0_0.Dll_Path)
        end
        return mp.INFECTED
      end
      return mp.CLEAN
    end
  end
end

