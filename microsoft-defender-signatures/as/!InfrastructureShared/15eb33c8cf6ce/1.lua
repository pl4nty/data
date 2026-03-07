-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\15eb33c8cf6ce\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 ~= nil then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC40: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not (this_sigattrlog[4]).matched or (this_sigattrlog[4]).utf8p1 == nil or (this_sigattrlog[5]).matched) and (this_sigattrlog[5]).utf8p1 ~= nil then
      local l_0_1 = (this_sigattrlog[4]).utf8p1
    else
    end
    -- DECOMPILER ERROR at PC68: Overwrote pending register: R0 in 'AssignReg'

    do
      if (not (this_sigattrlog[6]).matched or (this_sigattrlog[6]).utf8p1 == nil or (this_sigattrlog[7]).matched) and (this_sigattrlog[7]).utf8p1 ~= nil then
        local l_0_2 = (this_sigattrlog[6]).utf8p1
      else
      end
      -- DECOMPILER ERROR at PC96: Overwrote pending register: R0 in 'AssignReg'

      do
        if (not (this_sigattrlog[8]).matched or (this_sigattrlog[8]).utf8p1 == nil or (this_sigattrlog[9]).matched) and (this_sigattrlog[9]).utf8p1 ~= nil then
          local l_0_3, l_0_4 = (this_sigattrlog[8]).utf8p1
        end
        -- DECOMPILER ERROR at PC97: Confused about usage of register: R0 in 'UnsetPending'

        if l_0_3 == nil then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC104: Confused about usage of register: R0 in 'UnsetPending'

        local l_0_5 = nil
        local l_0_6 = (string.lower)(l_0_3)
        local l_0_7 = contains
        local l_0_8 = l_0_6
        l_0_7 = l_0_7(l_0_8, {"\\node_modules\\", "/node_modules/", "\\.openclaw\\skills\\"})
        if l_0_7 then
          l_0_7 = mp
          l_0_7 = l_0_7.CLEAN
          return l_0_7
        end
        l_0_8 = "\\temp\\"
        l_0_8 = contains
        l_0_8 = l_0_8(l_0_6, l_0_7)
        if not l_0_8 then
          l_0_8 = mp
          l_0_8 = l_0_8.CLEAN
          return l_0_8
        end
        l_0_8 = mp
        l_0_8 = l_0_8.IsKnownFriendlyFile
        l_0_8 = l_0_8(l_0_5, true, false)
        if l_0_8 then
          l_0_8 = mp
          l_0_8 = l_0_8.CLEAN
          return l_0_8
        end
        l_0_8 = bm
        l_0_8 = l_0_8.add_related_file
        l_0_8(l_0_5)
        l_0_8 = TrackPidAndTechniqueBM
        l_0_8("BM", "T1105", "CommandAndControl")
        l_0_8 = add_parents
        l_0_8()
        l_0_8 = mp
        l_0_8 = l_0_8.INFECTED
        return l_0_8
      end
    end
  end
end

