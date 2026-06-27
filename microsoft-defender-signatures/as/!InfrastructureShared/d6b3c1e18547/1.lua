-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d6b3c1e18547\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC6: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[3]).matched then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC22: Overwrote pending register: R0 in 'AssignReg'

  do
    if not (this_sigattrlog[4]).matched or (this_sigattrlog[5]).matched then
      local l_0_1, l_0_2 = this_sigattrlog[4]
    end
    -- DECOMPILER ERROR at PC23: Confused about usage of register: R0 in 'UnsetPending'

    if l_0_1 == nil then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC28: Confused about usage of register: R0 in 'UnsetPending'

    local l_0_3 = nil
    if l_0_1.utf8p1 == nil then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC36: Confused about usage of register: R1 in 'UnsetPending'

    -- DECOMPILER ERROR at PC50: Confused about usage of register: R1 in 'UnsetPending'

    -- DECOMPILER ERROR at PC59: Confused about usage of register: R1 in 'UnsetPending'

    if not (string.find)((string.lower)(l_0_1.utf8p1), ".local/share/updater", 1, true) and not (string.find)((string.lower)(l_0_1.utf8p1), ".config/systemd/user", 1, true) and not (string.find)((string.lower)(l_0_1.utf8p1), "launchagents", 1, true) then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC72: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (bm.add_related_string)("ShaiWorm_C2Install", (string.lower)(l_0_1.utf8p1), bm.RelatedStringBMReport)
    TrackPidAndTechniqueBM("BM", "T1543.002", "shaiworm_c2_install")
    addRelatedProcess()
    reportRelatedBmHits()
    local l_0_4, l_0_5 = , pcall(reportBmInfo)
    -- DECOMPILER ERROR at PC99: Overwrote pending register: R7 in 'AssignReg'

    if not l_0_5 and reportBmInfo then
      (bm.add_related_string)("bmInfoFailReason", tostring(R7_PC97), R7_PC97)
    end
    return mp.INFECTED
  end
end

