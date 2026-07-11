-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\9ab313b459a4\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 then
    local l_0_0, l_0_1, l_0_2, l_0_3, l_0_7, l_0_8 = nil
  end
  if not (this_sigattrlog[3]).matched or not (this_sigattrlog[3]).utf8p2 or (this_sigattrlog[3]).utf8p2 then
    local l_0_4 = nil
    local l_0_5 = contains
    local l_0_6 = l_0_4
    l_0_5 = l_0_5(l_0_6, {" install", " ci", " update", " rebuild"})
  end
  if not l_0_5 then
    l_0_5 = mp
    l_0_5 = l_0_5.CLEAN
    return l_0_5
  end
  l_0_5 = add_parents
  l_0_5()
  l_0_5 = pcall
  l_0_6 = reportBmInfo
  l_0_5 = l_0_5(l_0_6)
  local l_0_9, l_0_10 = nil
  if not l_0_5 and l_0_6 then
    l_0_9 = bm
    l_0_9 = l_0_9.add_related_string
    l_0_10 = "bmInfoFailReason"
    -- DECOMPILER ERROR at PC58: Overwrote pending register: R6 in 'AssignReg'

    l_0_9(l_0_10, tostring(R6_PC56), R6_PC56)
  end
  l_0_9 = mp
  l_0_9 = l_0_9.INFECTED
  return l_0_9
end

