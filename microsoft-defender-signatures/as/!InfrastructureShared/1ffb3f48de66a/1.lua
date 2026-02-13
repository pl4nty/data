-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1ffb3f48de66a\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 ~= nil then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC52: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not (this_sigattrlog[5]).matched or (this_sigattrlog[5]).utf8p2 == nil or (this_sigattrlog[6]).matched) and (this_sigattrlog[6]).utf8p2 ~= nil then
      local l_0_1, l_0_2 = (string.lower)((this_sigattrlog[5]).utf8p2)
    end
    -- DECOMPILER ERROR at PC53: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC55: Confused about usage of register: R0 in 'UnsetPending'

    if l_0_1 == nil or l_0_1 == "" then
      return mp.CLEAN
    end
    local l_0_3 = nil
    -- DECOMPILER ERROR at PC77: Overwrote pending register: R1 in 'AssignReg'

    -- DECOMPILER ERROR at PC95: Overwrote pending register: R1 in 'AssignReg'

    -- DECOMPILER ERROR at PC113: Overwrote pending register: R1 in 'AssignReg'

    -- DECOMPILER ERROR at PC131: Overwrote pending register: R1 in 'AssignReg'

    -- DECOMPILER ERROR at PC134: Confused about usage of register: R1 in 'UnsetPending'

    -- DECOMPILER ERROR at PC138: Unhandled construct in 'MakeBoolean' P3

    -- DECOMPILER ERROR at PC138: Unhandled construct in 'MakeBoolean' P3

    -- DECOMPILER ERROR at PC138: Unhandled construct in 'MakeBoolean' P3

    if ((((not (this_sigattrlog[7]).matched or (this_sigattrlog[7]).utf8p2 == nil or (this_sigattrlog[8]).matched) and not (this_sigattrlog[9]).matched) or (this_sigattrlog[10]).matched) and nil == nil) or nil == "" then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC141: Confused about usage of register: R1 in 'UnsetPending'

    if (string.find)(nil, l_0_3, 1, true) then
      addRelatedProcess()
      reportRelatedBmHits()
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end

