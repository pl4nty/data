-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\17ab31b02064d\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC11: Overwrote pending register: R0 in 'AssignReg'

do
  -- DECOMPILER ERROR at PC54: Unhandled construct in 'MakeBoolean' P3

  -- DECOMPILER ERROR at PC54: Unhandled construct in 'MakeBoolean' P3

  -- DECOMPILER ERROR at PC54: Unhandled construct in 'MakeBoolean' P3

  -- DECOMPILER ERROR at PC54: Unhandled construct in 'MakeBoolean' P3

  if (((this_sigattrlog[2] == nil or not (this_sigattrlog[2]).matched or nil == nil) and (this_sigattrlog[3]).utf8p1 ~= nil) or (this_sigattrlog[4]).utf8p1 == nil) and this_sigattrlog[5] ~= nil and (this_sigattrlog[5]).matched then
    local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4, l_0_5, l_0_6, l_0_7, l_0_8, l_0_9 = (this_sigattrlog[5]).utf8p1
  end
  -- DECOMPILER ERROR at PC54: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC56: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 == nil or l_0_0 == "" then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC61: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC67: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0:sub(1, 5) ~= "/tmp/" and l_0_0:sub(1, 9) ~= "/dev/shm/" then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC78: Confused about usage of register: R0 in 'UnsetPending'

  if (string.find)(l_0_0, "/tmp/krb5", 1, true) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC90: Confused about usage of register: R0 in 'UnsetPending'

  if (string.find)(l_0_0, "/tmp/host_", 1, true) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC102: Confused about usage of register: R0 in 'UnsetPending'

  if (string.find)(l_0_0, "/tmp/pam_krb5_tmp", 1, true) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC114: Confused about usage of register: R0 in 'UnsetPending'

  if (string.find)(l_0_0, "/tmp/.x11-unix/", 1, true) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC126: Confused about usage of register: R0 in 'UnsetPending'

  if (string.find)(l_0_0, "/tmp/ssh-", 1, true) then
    return mp.CLEAN
  end
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end

