-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4ab3b347df19\0x000012a5_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC11: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched then
    local l_0_0, l_0_1 = nil
  end
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 == nil then
    return mp.CLEAN
  end
  local l_0_2 = nil
  local l_0_3 = contains
  local l_0_4 = l_0_2
  l_0_3 = l_0_3(l_0_4, {"winrar.exe"})
  if not l_0_3 then
    l_0_3 = mp
    l_0_3 = l_0_3.INFECTED
    return l_0_3
  end
  l_0_3 = mp
  l_0_3 = l_0_3.CLEAN
  return l_0_3
end

