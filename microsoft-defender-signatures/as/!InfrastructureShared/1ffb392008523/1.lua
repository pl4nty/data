-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1ffb392008523\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).timestamp ~= nil then
    local l_0_0, l_0_1, l_0_2 = nil
  else
  end
  if not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).timestamp == nil or (this_sigattrlog[2]).timestamp == nil then
    return mp.CLEAN
  end
  local l_0_3 = nil
  -- DECOMPILER ERROR at PC45: Overwrote pending register: R1 in 'AssignReg'

  -- DECOMPILER ERROR at PC59: Overwrote pending register: R1 in 'AssignReg'

  -- DECOMPILER ERROR at PC73: Overwrote pending register: R1 in 'AssignReg'

  -- DECOMPILER ERROR at PC87: Overwrote pending register: R1 in 'AssignReg'

  -- DECOMPILER ERROR at PC101: Overwrote pending register: R1 in 'AssignReg'

  -- DECOMPILER ERROR at PC115: Overwrote pending register: R1 in 'AssignReg'

  -- DECOMPILER ERROR at PC129: Overwrote pending register: R1 in 'AssignReg'

  -- DECOMPILER ERROR at PC143: Overwrote pending register: R1 in 'AssignReg'

  -- DECOMPILER ERROR at PC148: Unhandled construct in 'MakeBoolean' P3

  -- DECOMPILER ERROR at PC148: Unhandled construct in 'MakeBoolean' P3

  -- DECOMPILER ERROR at PC148: Unhandled construct in 'MakeBoolean' P3

  -- DECOMPILER ERROR at PC148: Unhandled construct in 'MakeBoolean' P3

  -- DECOMPILER ERROR at PC148: Unhandled construct in 'MakeBoolean' P3

  -- DECOMPILER ERROR at PC148: Unhandled construct in 'MakeBoolean' P3

  -- DECOMPILER ERROR at PC148: Unhandled construct in 'MakeBoolean' P3

  if ((((((((this_sigattrlog[3]).matched and (this_sigattrlog[3]).timestamp ~= nil and not (this_sigattrlog[4]).matched) or (this_sigattrlog[5]).matched) and not (this_sigattrlog[6]).matched) or (this_sigattrlog[7]).matched) and not (this_sigattrlog[8]).matched) or (this_sigattrlog[9]).matched) and not (this_sigattrlog[10]).matched) or nil == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC149: Confused about usage of register: R1 in 'UnsetPending'

  if l_0_3 < nil then
    reportRelatedBmHits()
    addRelatedProcess()
    return mp.INFECTED
  end
  return mp.CLEAN
end

