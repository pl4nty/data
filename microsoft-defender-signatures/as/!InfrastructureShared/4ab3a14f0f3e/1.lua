-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4ab3a14f0f3e\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC17: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil and (this_sigattrlog[1]).utf8p2 ~= "" then
    local l_0_0, l_0_2 = nil, nil
  end
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil and (this_sigattrlog[2]).utf8p2 ~= "" and (this_sigattrlog[2]).utf8p1 ~= nil and (this_sigattrlog[2]).utf8p1 ~= "" then
    local l_0_1, l_0_3 = , (string.lower)((this_sigattrlog[2]).utf8p2)
    -- DECOMPILER ERROR at PC56: Overwrote pending register: R2 in 'AssignReg'

    local l_0_4 = nil
  end
  do
    -- DECOMPILER ERROR at PC57: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC59: Confused about usage of register: R1 in 'UnsetPending'

    -- DECOMPILER ERROR at PC61: Confused about usage of register: R2 in 'UnsetPending'

    -- DECOMPILER ERROR at PC63: Confused about usage of register: R1 in 'UnsetPending'

    -- DECOMPILER ERROR at PC63: Confused about usage of register: R0 in 'UnsetPending'

    if l_0_1 ~= nil and l_0_3 ~= nil and l_0_4 ~= nil then
      if l_0_1 ~= l_0_3 then
        return mp.CLEAN
      end
      local l_0_5 = nil
      local l_0_6 = nil
      -- DECOMPILER ERROR at PC73: Confused about usage of register: R2 in 'UnsetPending'

      -- DECOMPILER ERROR at PC78: Confused about usage of register: R3 in 'UnsetPending'

      -- DECOMPILER ERROR at PC80: Confused about usage of register: R2 in 'UnsetPending'

      if not IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", l_0_4) then
        AppendToRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", l_0_4, 86400)
        -- DECOMPILER ERROR at PC86: Confused about usage of register: R2 in 'UnsetPending'

        ;
        (bm.trigger_sig)("BM_UnsignedOrAdhocMacBin", l_0_4)
        return mp.INFECTED
      end
    end
    do
      return mp.CLEAN
    end
  end
end

