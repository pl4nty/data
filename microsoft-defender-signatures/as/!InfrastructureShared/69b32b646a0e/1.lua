-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\69b32b646a0e\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[3]).matched then
    local l_0_0, l_0_1, l_0_2 = nil
  end
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_3 = nil
  if not l_0_3 or not ((string.lower)(l_0_0)):match("hkcu\\software\\[^\\]+$") then
    return mp.CLEAN
  end
  local l_0_4, l_0_5 = , nil
  -- DECOMPILER ERROR at PC33: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC40: Overwrote pending register: R2 in 'AssignReg'

  if (not (this_sigattrlog[4]).matched or l_0_5) and (string.find)(l_0_5, l_0_4) and #nil >= 10 then
    return mp.INFECTED
  end
  return mp.CLEAN
end

