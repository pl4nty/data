-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\edb302fa4d27\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC52: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not (this_sigattrlog[3]).matched or (this_sigattrlog[3]).utf8p1 == nil or (this_sigattrlog[4]).matched) and (this_sigattrlog[4]).utf8p1 ~= nil then
      local l_0_1, l_0_2, l_0_3 = (string.lower)((this_sigattrlog[3]).utf8p1)
    end
    -- DECOMPILER ERROR at PC53: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC55: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC59: Confused about usage of register: R0 in 'UnsetPending'

    if l_0_1 == nil or #l_0_1 <= 4 or not StringEndsWith(l_0_1, ".exe") then
      return mp.CLEAN
    end
    local l_0_4 = nil
    -- DECOMPILER ERROR at PC84: Overwrote pending register: R1 in 'AssignReg'

    if not (this_sigattrlog[5]).matched or (this_sigattrlog[5]).utf8p2 == nil or nil == nil then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC92: Confused about usage of register: R1 in 'UnsetPending'

    if (string.find)(nil, l_0_4, 1, true) ~= nil then
      return mp.CLEAN
    end
    local l_0_5 = nil
    if l_0_4:match("([^\\]+)$") == nil and #l_0_4:match("([^\\]+)$") <= 4 then
      return mp.CLEAN
    end
    if (string.find)(l_0_5, " " .. l_0_4:match("([^\\]+)$"), 1, true) ~= nil then
      AppendToRollingQueue("BmProcessSearchOrderHijackB", l_0_4, 1, 120)
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end

