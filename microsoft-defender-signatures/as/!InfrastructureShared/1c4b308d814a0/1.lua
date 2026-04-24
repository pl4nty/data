-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1c4b308d814a0\1.luac 

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
  if not (string.find)(l_0_1, "/resources/app", 1, true) then
    return mp.CLEAN
  end
  local l_0_2 = (bm.get_imagepath)()
  if isnull(l_0_2) then
    return mp.CLEAN
  end
  local l_0_3 = (string.lower)(l_0_2)
  local l_0_4 = {}
  -- DECOMPILER ERROR at PC87: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC88: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC89: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC90: Overwrote pending register: R6 in 'AssignReg'

  if ("/node")("/npm", "/npx", true) then
    return mp.CLEAN
  end
  local l_0_5 = (string.find)(l_0_1, "/resources/app", 1, true)
  do
    if l_0_5 and l_0_5 > 1 then
      local l_0_6 = (string.sub)(l_0_1, 1, l_0_5 - 1)
      -- DECOMPILER ERROR at PC119: Overwrote pending register: R9 in 'AssignReg'

      if (string.sub)(l_0_3, 1, "/electron-builder") == l_0_6 then
        return mp.CLEAN
      end
    end
    local l_0_7 = (string.find)(l_0_1, ".app/", 1, true)
    do
      do
        if l_0_7 then
          local l_0_8 = (string.sub)(l_0_1, 1, l_0_7 + 3)
          -- DECOMPILER ERROR at PC145: Overwrote pending register: R10 in 'AssignReg'

          if (string.sub)(l_0_3, 1, "/snap/") == l_0_8 then
            return mp.CLEAN
          end
        end
        if (mp.IsKnownFriendlyFile)(l_0_2, true, false) then
          return mp.CLEAN
        end
        ;
        (bm.add_related_string)("xp_electron_scriptjack_path", l_0_1, bm.RelatedStringBMReport)
        add_parents()
        TrackPidAndTechniqueBM("BM", "T1218.015", "ElectronScriptJackXP")
        do return mp.INFECTED end
        -- WARNING: undefined locals caused missing assignments!
      end
    end
  end
end

