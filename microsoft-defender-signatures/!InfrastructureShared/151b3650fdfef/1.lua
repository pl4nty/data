-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\151b3650fdfef\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 ~= nil then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC52: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not (this_sigattrlog[5]).matched or (this_sigattrlog[5]).utf8p1 == nil or (this_sigattrlog[6]).matched) and (this_sigattrlog[6]).utf8p1 ~= nil then
      local l_0_1 = (string.lower)((this_sigattrlog[5]).utf8p1)
    else
    end
    -- DECOMPILER ERROR at PC88: Overwrote pending register: R0 in 'AssignReg'

    do
      if (not (this_sigattrlog[7]).matched or (this_sigattrlog[7]).utf8p1 == nil or (this_sigattrlog[8]).matched) and (this_sigattrlog[8]).utf8p1 ~= nil then
        local l_0_2, l_0_3, l_0_4, l_0_5, l_0_6, l_0_7 = (string.lower)((this_sigattrlog[7]).utf8p1)
      end
      -- DECOMPILER ERROR at PC89: Confused about usage of register: R0 in 'UnsetPending'

      -- DECOMPILER ERROR at PC91: Confused about usage of register: R0 in 'UnsetPending'

      if l_0_2 == nil or l_0_2 == "" then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC99: Confused about usage of register: R0 in 'UnsetPending'

      ;
      (bm.add_related_string)("file_metadata", l_0_2, bm.RelatedStringBMReport)
      TrackPidAndTechniqueBM("BM", "T1204.002", "Execution_MaliciousFile")
      addRelatedProcess()
      reportRelatedBmHits()
      return mp.INFECTED
    end
  end
end

