-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\349b37ab7f308\1_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil then
  local l_0_0, l_0_3, l_0_7 = nil, nil, nil
  local l_0_1, l_0_4, l_0_8 = nil
  l_0_4 = tonumber
  l_0_8 = this_sigattrlog
  l_0_8 = l_0_8[1]
  l_0_8 = l_0_8.ppid
  l_0_4 = l_0_4(l_0_8)
  l_0_7 = l_0_4
  local l_0_2, l_0_5, l_0_9 = nil
end
do
  do
    if (this_sigattrlog[9]).matched and (this_sigattrlog[9]).utf8p1 ~= nil then
      local l_0_6, l_0_10 = , l_0_3
    end
    -- DECOMPILER ERROR at PC47: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC54: Confused about usage of register: R2 in 'UnsetPending'

    -- DECOMPILER ERROR at PC55: Confused about usage of register: R3 in 'UnsetPending'

    if l_0_6 and (string.lower)((this_sigattrlog[9]).utf8p1) then
      local l_0_11, l_0_12 = nil
      if not pcall(bm.GetModAddress, l_0_7, (string.lower)((this_sigattrlog[9]).utf8p1)) or isnull(R7_PC61) then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC69: Overwrote pending register: R7 in 'AssignReg'

      -- DECOMPILER ERROR at PC70: Confused about usage of register: R2 in 'UnsetPending'

      -- DECOMPILER ERROR at PC71: Confused about usage of register: R3 in 'UnsetPending'

      local l_0_13, l_0_14 = nil
      if not pcall(R7_PC61, l_0_7, (string.lower)((this_sigattrlog[9]).utf8p1), "ldrpmrdatabase") or isnull(R9_PC78) then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC86: Overwrote pending register: R9 in 'AssignReg'

      local l_0_15, l_0_16 = nil
      if not pcall(R9_PC78, l_0_13, l_0_14, "avrfpapilookupcallbackroutine") or isnull(R11_PC95) then
        return mp.CLEAN
      end
      ;
      (bm.add_related_string)(R11_PC95, l_0_12, bm.RelatedStringBMReport)
      -- DECOMPILER ERROR at PC110: Overwrote pending register: R11 in 'AssignReg'

      ;
      (bm.add_related_string)(R11_PC95, l_0_16, bm.RelatedStringBMReport)
      -- DECOMPILER ERROR at PC117: Overwrote pending register: R11 in 'AssignReg'

      ;
      (bm.add_related_string)(R11_PC95, R12_PC121, bm.RelatedStringBMReport)
      -- DECOMPILER ERROR at PC124: Overwrote pending register: R11 in 'AssignReg'

      ;
      (bm.add_related_string)(R11_PC95, R12_PC121, bm.RelatedStringBMReport)
      return mp.INFECTED
    end
    do
      return mp.CLEAN
    end
  end
end

