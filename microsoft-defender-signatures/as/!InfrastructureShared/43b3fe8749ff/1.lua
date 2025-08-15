-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\43b3fe8749ff\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil then
    local l_0_0, l_0_1, l_0_2, l_0_3 = nil
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC15: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC18: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 ~= nil and l_0_0 ~= "" and StringEndsWith(l_0_0, ".elf") then
    addRelatedProcess()
    reportRelatedBmHits()
    return mp.INFECTED
  end
  return mp.CLEAN
end

