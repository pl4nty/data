-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00000db4_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[2]).matched then
  local l_0_0, l_0_1 = nil, nil
  l_0_1 = (this_sigattrlog[2]).utf8p1
  local l_0_2 = nil
end
do
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R0 in 'UnsetPending'

  if not l_0_0 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R1 in 'UnsetPending'

  if not l_0_1 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC27: Confused about usage of register: R1 in 'UnsetPending'

  if (string.lower)(l_0_0) == (string.lower)(l_0_1) then
    return mp.CLEAN
  end
  return mp.INFECTED
end

