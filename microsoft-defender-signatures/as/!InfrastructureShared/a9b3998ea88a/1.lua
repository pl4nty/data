-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\a9b3998ea88a\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0, l_0_1 = nil
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  if #l_0_0 < 62 then
    return mp.CLEAN
  end
  local l_0_2 = nil
  local l_0_3 = contains
  local l_0_4 = l_0_2
  l_0_3 = l_0_3(l_0_4, {"powershell", " mshta", " bitsadmin", "curl"})
  if l_0_3 then
    l_0_3 = bm
    l_0_3 = l_0_3.add_related_string
    l_0_4 = "typedpath"
    l_0_3(l_0_4, tostring(l_0_2), bm.RelatedStringBMReport)
    l_0_3 = add_parents
    l_0_3()
    l_0_3 = mp
    l_0_3 = l_0_3.INFECTED
    return l_0_3
  end
  l_0_3 = mp
  l_0_3 = l_0_3.CLEAN
  return l_0_3
end

