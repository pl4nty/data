-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\69b3f7dde6c3\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched then
    local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4 = nil
  end
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R0 in 'UnsetPending'

  if (string.find)(l_0_0, "/dracut/", 1, true) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R0 in 'UnsetPending'

  if isTainted(l_0_0, "remote_file_created_taint") then
    return mp.INFECTED
  end
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC39: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC47: Confused about usage of register: R0 in 'UnsetPending'

  if (string.sub)(l_0_0, 0, 5) == "/tmp/" or (string.sub)(l_0_0, 0, 9) == "/var/tmp/" or (string.sub)(l_0_0, 0, 9) == "/dev/shm/" then
    return mp.INFECTED
  end
  return mp.CLEAN
end

