-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\53b399516f1c\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
    local l_0_0, l_0_1, l_0_2, l_0_3 = nil
  end
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC28: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC37: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC46: Confused about usage of register: R0 in 'UnsetPending'

  if (string.find)(l_0_0, "--ignore-existing", 1, true) and (string.find)(l_0_0, "--auto-confirm", 1, true) and (string.find)(l_0_0, "--transfers", 1, true) and (string.find)(l_0_0, "--multi-thread-streams", 1, true) then
    return mp.INFECTED
  end
  return mp.CLEAN
end

