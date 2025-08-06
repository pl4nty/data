-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\f7b3697d63b0\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC17: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil and (this_sigattrlog[2]).utf8p2 ~= "" then
    local l_0_0, l_0_1, l_0_2, l_0_3 = nil
  else
  end
  -- DECOMPILER ERROR at PC39: Confused about usage of register: R0 in 'UnsetPending'

  if ((this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil and (this_sigattrlog[3]).utf8p2 ~= "" and (this_sigattrlog[3]).utf8p2 == nil) or (this_sigattrlog[3]).utf8p2 == "" then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC45: Confused about usage of register: R0 in 'UnsetPending'

  if is_valid_ip((this_sigattrlog[3]).utf8p2) then
    return mp.INFECTED
  end
  return mp.CLEAN
end

