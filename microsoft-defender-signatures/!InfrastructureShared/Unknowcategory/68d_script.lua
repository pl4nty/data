-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\68d_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched then
    local l_0_0, l_0_1 = nil
  end
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_2 = nil
  if (string.find)((string.lower)(l_0_0), "\\program files\\", 1, true) ~= nil or (string.find)((string.lower)(l_0_0), "\\program files (x86)\\", 1, true) ~= nil or (string.find)((string.lower)(l_0_0), "\\appdata\\", 1, true) ~= nil then
    return mp.INFECTED
  end
  return mp.CLEAN
end

