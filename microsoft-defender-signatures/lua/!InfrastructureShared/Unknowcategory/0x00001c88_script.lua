-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00001c88_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC17: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[6]).matched and (this_sigattrlog[6]).utf8p1 ~= nil and (this_sigattrlog[6]).utf8p1 ~= "" then
    local l_0_0, l_0_2, l_0_3, l_0_4 = nil, nil
  end
  do
    if (this_sigattrlog[7]).matched and (this_sigattrlog[7]).utf8p1 ~= nil and (this_sigattrlog[7]).utf8p1 ~= "" then
      local l_0_1 = nil
    end
    -- DECOMPILER ERROR at PC36: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC40: Confused about usage of register: R1 in 'UnsetPending'

    -- DECOMPILER ERROR at PC40: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC44: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC51: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC58: Confused about usage of register: R0 in 'UnsetPending'

    if l_0_1 ~= nil and (this_sigattrlog[7]).utf8p1 ~= nil and (l_0_1 == (this_sigattrlog[7]).utf8p1 or (string.match)(l_0_1, "^127.") or (string.match)(l_0_1, "^::1*") or (string.match)(l_0_1, "^0.0.0.0")) then
      return mp.CLEAN
    end
    return mp.INFECTED
  end
end

