-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1bab376bbfc18\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[2]).matched then
  local l_0_0, l_0_1 = nil, nil
  l_0_1 = (this_sigattrlog[2]).utf8p1
  local l_0_2 = nil
end
do
  -- DECOMPILER ERROR at PC29: Overwrote pending register: R0 in 'AssignReg'

  if not (this_sigattrlog[3]).matched or (this_sigattrlog[4]).matched then
    local l_0_3, l_0_4 = (this_sigattrlog[3]).utf8p2, (this_sigattrlog[3]).utf8p1
    l_0_4 = (this_sigattrlog[4]).utf8p1
    local l_0_5 = nil
  end
  do
    -- DECOMPILER ERROR at PC51: Overwrote pending register: R0 in 'AssignReg'

    if not (this_sigattrlog[5]).matched or (this_sigattrlog[6]).matched then
      local l_0_6, l_0_7 = (this_sigattrlog[5]).utf8p2, (this_sigattrlog[5]).utf8p1
      l_0_7 = (this_sigattrlog[6]).utf8p1
      local l_0_8 = nil
    end
    do
      -- DECOMPILER ERROR at PC73: Overwrote pending register: R0 in 'AssignReg'

      if not (this_sigattrlog[7]).matched or (this_sigattrlog[8]).matched then
        local l_0_9, l_0_10 = (this_sigattrlog[7]).utf8p2, (this_sigattrlog[7]).utf8p1
        l_0_10 = (this_sigattrlog[8]).utf8p1
        local l_0_11 = nil
      end
      do
        -- DECOMPILER ERROR at PC95: Overwrote pending register: R0 in 'AssignReg'

        if not (this_sigattrlog[9]).matched or (this_sigattrlog[10]).matched then
          local l_0_12, l_0_13, l_0_15, l_0_17 = (this_sigattrlog[9]).utf8p2, (this_sigattrlog[9]).utf8p1
          l_0_15 = this_sigattrlog
          l_0_15 = l_0_15[10]
          l_0_13 = l_0_15.utf8p1
          local l_0_14, l_0_16, l_0_18 = nil
        end
        do
          -- DECOMPILER ERROR at PC99: Confused about usage of register: R1 in 'UnsetPending'

          -- DECOMPILER ERROR at PC101: Confused about usage of register: R0 in 'UnsetPending'

          if not l_0_13 or not l_0_12 then
            return mp.CLEAN
          end
          -- DECOMPILER ERROR at PC109: Confused about usage of register: R0 in 'UnsetPending'

          ;
          (bm.add_related_string)("InjectionType", l_0_12, bm.RelatedStringBMReport)
          -- DECOMPILER ERROR at PC116: Confused about usage of register: R1 in 'UnsetPending'

          ;
          (bm.add_related_string)("InjectedIn", l_0_13, bm.RelatedStringBMReport)
          return mp.INFECTED
        end
      end
    end
  end
end

