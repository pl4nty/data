-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\147b33ce046c7\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC17: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil and (this_sigattrlog[1]).utf8p1 ~= "" then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC55: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not (this_sigattrlog[2]).matched or (this_sigattrlog[1]).utf8p1 == nil or (this_sigattrlog[2]).utf8p1 == "" or (this_sigattrlog[3]).matched) and (this_sigattrlog[3]).utf8p1 ~= nil and (this_sigattrlog[3]).utf8p1 ~= "" then
      local l_0_1 = (this_sigattrlog[2]).utf8p1
    else
    end
    -- DECOMPILER ERROR at PC93: Overwrote pending register: R0 in 'AssignReg'

    do
      if (not (this_sigattrlog[4]).matched or (this_sigattrlog[4]).utf8p1 == nil or (this_sigattrlog[4]).utf8p1 == "" or (this_sigattrlog[5]).matched) and (this_sigattrlog[5]).utf8p1 ~= nil and (this_sigattrlog[5]).utf8p1 ~= "" then
        local l_0_2, l_0_3, l_0_4 = (this_sigattrlog[4]).utf8p1
      end
      -- DECOMPILER ERROR at PC94: Confused about usage of register: R0 in 'UnsetPending'

      if l_0_2 == nil then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC102: Confused about usage of register: R0 in 'UnsetPending'

      ;
      (bm.trigger_sig)("ParentRuningfromWWD", l_0_2)
      local l_0_5, l_0_6 = , (bm.get_process_relationships)()
      for l_0_10,l_0_11 in ipairs(R4_PC109) do
        local l_0_7 = nil
        -- DECOMPILER ERROR at PC115: Confused about usage of register: R7 in 'UnsetPending'

        ;
        (bm.trigger_sig)("ParentRuningfromWWD", l_0_5, R7_PC115.ppid)
      end
      return mp.INFECTED
    end
  end
end

