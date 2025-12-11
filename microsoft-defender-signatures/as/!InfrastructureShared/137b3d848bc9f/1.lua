-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\137b3d848bc9f\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0 = nil
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC15: Confused about usage of register: R0 in 'UnsetPending'

  do
    if l_0_0 then
      local l_0_1, l_0_3 = l_0_0:lower()
      l_0_3 = l_0_3(l_0_1, "node%.exe\"?%s+\"?([^\"]+%.js)\"?")
      local l_0_2 = nil
      l_0_2 = bm
      l_0_2 = l_0_2.add_threat_file
      l_0_2(l_0_3)
    end
    local l_0_4, l_0_5 = , pcall(reportBmInfo)
    -- DECOMPILER ERROR at PC39: Overwrote pending register: R6 in 'AssignReg'

    if not l_0_5 and reportBmInfo then
      (bm.add_related_string)("bmInfoFailReason", tostring(R6_PC37), R6_PC37)
    end
    return mp.INFECTED
  end
end

