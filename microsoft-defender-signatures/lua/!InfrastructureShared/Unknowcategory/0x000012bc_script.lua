-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x000012bc_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil then
    local l_0_0, l_0_1, l_0_2, l_0_3 = nil
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC19: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC31: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC43: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC55: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 ~= nil and (string.find)((string.lower)(l_0_0), "\\appdata\\local\\temp\\", 1, true) ~= nil and ((string.find)((string.lower)(l_0_0), ".com", 1, true) ~= nil or (string.find)((string.lower)(l_0_0), ".pif", 1, true) ~= nil or (string.find)((string.lower)(l_0_0), ".src", 1, true) ~= nil) then
    return mp.INFECTED
  end
  return mp.CLEAN
end

