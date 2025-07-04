-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\beb36479a884\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC6: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[3]).matched then
  local l_0_0, l_0_1, l_0_2 = nil
else
  do
    do return mp.CLEAN end
    -- DECOMPILER ERROR at PC12: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

    if isnull(l_0_0.utf8p1) or isnull(l_0_0.utf8p2) then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC26: Confused about usage of register: R0 in 'UnsetPending'

    local l_0_3 = nil
    if isnull((string.match)(l_0_0.utf8p1, "targetprocessppid:(%d+)")) then
      return mp.CLEAN
    end
    local l_0_4 = nil
    if isnull((mp.GetPPidFromPid)((string.match)(l_0_0.utf8p1, "targetprocessppid:(%d+)"))) then
      return mp.CLEAN
    end
    ;
    (bm.request_SMS)((mp.GetPPidFromPid)((string.match)(l_0_0.utf8p1, "targetprocessppid:(%d+)")), "m")
    ;
    (bm.add_action)("SmsAsyncScanEvent", 1)
    return mp.INFECTED
  end
end

