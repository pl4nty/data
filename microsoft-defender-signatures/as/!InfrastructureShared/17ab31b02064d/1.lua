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
    local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4, l_0_5, l_0_6, l_0_7, l_0_8, l_0_9, l_0_10, l_0_11, l_0_12, l_0_13, l_0_14, l_0_15, l_0_16, l_0_17, l_0_18, l_0_19, l_0_20, l_0_21, l_0_22, l_0_23, l_0_24, l_0_25, l_0_26, l_0_27, l_0_28, l_0_29, l_0_30, l_0_31 = (this_sigattrlog[5]).utf8p1
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
  -- DECOMPILER ERROR at PC138: Confused about usage of register: R0 in 'UnsetPending'

  if (string.find)(l_0_0, "/dev/shm/esso_", 1, true) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC150: Confused about usage of register: R0 in 'UnsetPending'

  if (string.find)(l_0_0, "/tmp/crmsh_", 1, true) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC162: Confused about usage of register: R0 in 'UnsetPending'

  if (string.find)(l_0_0, "/tmp/qb-event-", 1, true) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC174: Confused about usage of register: R0 in 'UnsetPending'

  if (string.find)(l_0_0, "/tmp/qb-request-", 1, true) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC186: Confused about usage of register: R0 in 'UnsetPending'

  if (string.find)(l_0_0, "/tmp/qb-response-", 1, true) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC198: Confused about usage of register: R0 in 'UnsetPending'

  if (string.find)(l_0_0, "/tmp/qb-cib_", 1, true) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC210: Confused about usage of register: R0 in 'UnsetPending'

  if (string.find)(l_0_0, "/tmp/hstcert_", 1, true) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC222: Confused about usage of register: R0 in 'UnsetPending'

  if (string.find)(l_0_0, "/tmp/PrivateArkEx_", 1, true) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC234: Confused about usage of register: R0 in 'UnsetPending'

  if (string.match)(l_0_0, "^/tmp/eth%d") then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC244: Confused about usage of register: R0 in 'UnsetPending'

  if (string.find)(l_0_0, "/tmp/col_monitor_", 1, true) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC256: Confused about usage of register: R0 in 'UnsetPending'

  if (string.find)(l_0_0, "/tmp/ora_", 1, true) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC268: Confused about usage of register: R0 in 'UnsetPending'

  if (string.find)(l_0_0, "/dev/shm/ora_", 1, true) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC280: Confused about usage of register: R0 in 'UnsetPending'

  if (string.find)(l_0_0, "/tmp/.nstat.", 1, true) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC292: Confused about usage of register: R0 in 'UnsetPending'

  if (string.find)(l_0_0, "/tmp/tmpacfsCHECK", 1, true) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC304: Confused about usage of register: R0 in 'UnsetPending'

  if (string.find)(l_0_0, "/tmp/hpraidstatus", 1, true) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC316: Confused about usage of register: R0 in 'UnsetPending'

  if (string.match)(l_0_0, "^/tmp/list%d") then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC326: Confused about usage of register: R0 in 'UnsetPending'

  if (string.find)(l_0_0, "/tmp/collect_perf_data.", 1, true) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC338: Confused about usage of register: R0 in 'UnsetPending'

  if (string.find)(l_0_0, "/tmp/.cache/motd.", 1, true) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC350: Confused about usage of register: R0 in 'UnsetPending'

  if (string.find)(l_0_0, "/tmp/sh-thd-", 1, true) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC360: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC362: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 == "/tmp/stdout" or l_0_0 == "/tmp/exit" then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC367: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 == "/tmp/stat" then
    return mp.CLEAN
  end
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end

