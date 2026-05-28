-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\21b3143f98ea\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).np2 then
    local l_0_0, l_0_1 = nil
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC15: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 < 79000 or l_0_0 > 98000 then
    return mp.CLEAN
  end
  local l_0_2, l_0_3 = , pcall(reportBmInfo)
  -- DECOMPILER ERROR at PC34: Overwrote pending register: R6 in 'AssignReg'

  if not l_0_3 and reportBmInfo then
    (bm.add_related_string)("bmInfoFailReason", tostring(R6_PC32), R6_PC32)
  end
  return mp.INFECTED
end

