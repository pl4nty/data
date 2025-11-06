-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\adb30ddca714\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_2, l_0_3 = nil
  else
  end
  -- DECOMPILER ERROR at PC37: Confused about usage of register: R0 in 'UnsetPending'

  if ((this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil and (string.lower)((this_sigattrlog[2]).utf8p2) == nil) or (string.lower)((this_sigattrlog[2]).utf8p2) == "" then
    return mp.CLEAN
  end
  local l_0_4 = nil
  -- DECOMPILER ERROR at PC59: Overwrote pending register: R1 in 'AssignReg'

  -- DECOMPILER ERROR at PC77: Overwrote pending register: R1 in 'AssignReg'

  -- DECOMPILER ERROR at PC80: Confused about usage of register: R1 in 'UnsetPending'

  -- DECOMPILER ERROR at PC84: Unhandled construct in 'MakeBoolean' P3

  if ((not (this_sigattrlog[3]).matched or (this_sigattrlog[3]).utf8p2 == nil or (this_sigattrlog[4]).matched) and nil == nil) or nil == "" then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC87: Confused about usage of register: R1 in 'UnsetPending'

  if (string.find)(nil, l_0_4, 1, true) then
    reportRelatedBmHits()
    addRelatedProcess()
    return mp.INFECTED
  end
  return mp.CLEAN
end

