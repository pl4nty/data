-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\246b3f023f27b\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil then
    local l_0_0 = nil
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_1 = (string.lower)(l_0_0)
  if not (string.find)(l_0_1, "\\resources\\app", 1, true) then
    return mp.CLEAN
  end
  local l_0_2 = (bm.get_imagepath)()
  if isnull(l_0_2) then
    return mp.CLEAN
  end
  l_0_2 = (string.lower)(l_0_2)
  if (string.find)(l_0_2, "\\windows defender\\msmpeng.exe", 1, true) then
    return mp.CLEAN
  end
  local l_0_3 = {}
  -- DECOMPILER ERROR at PC88: No list found for R2 , SetList fails

  -- DECOMPILER ERROR at PC89: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC90: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC91: Overwrote pending register: R5 in 'AssignReg'

  if ("\\update.exe")("\\squirrel.exe", "\\setup.exe", true) then
    return mp.CLEAN
  end
  if (string.find)(l_0_2, "\\system32\\svchost.exe", 1, true) and ((string.find)(l_0_1, "\\windowsapps\\", 1, true) or (string.find)(l_0_1, "\\program files\\", 1, true) or (string.find)(l_0_1, "\\program files (x86)\\", 1, true)) then
    return mp.CLEAN
  end
  local l_0_4 = (string.find)(l_0_1, "\\resources\\app", 1, true)
  do
    do
      if l_0_4 and l_0_4 > 1 then
        local l_0_5 = (string.sub)(l_0_1, 1, l_0_4 - 1)
        -- DECOMPILER ERROR at PC159: Overwrote pending register: R8 in 'AssignReg'

        if (string.sub)(l_0_2, 1, "\\windows\\system32\\msiexec.exe") == l_0_5 then
          return mp.CLEAN
        end
      end
      if (mp.IsKnownFriendlyFile)(l_0_2, true, false) then
        return mp.CLEAN
      end
      ;
      (bm.add_related_string)("electron_scriptjack_path", l_0_1, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("electron_scriptjack_proc", l_0_2, bm.RelatedStringBMReport)
      add_parents()
      TrackPidAndTechniqueBM("BM", "T1218.015", "ElectronScriptJack")
      do return mp.INFECTED end
      -- WARNING: undefined locals caused missing assignments!
    end
  end
end

