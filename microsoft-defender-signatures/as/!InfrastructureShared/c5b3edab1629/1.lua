-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c5b3edab1629\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC6: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched then
    local l_0_0, l_0_1, l_0_2 = nil
  else
  end
  if (this_sigattrlog[3]).matched then
    do return mp.CLEAN end
    if not IsBasToolProcessForPpid("BM", "Picus") and not IsBasToolProcessFoundInParents("BM", "Picus", 4) then
      return mp.CLEAN
    end
    local l_0_3 = nil
    -- DECOMPILER ERROR at PC43: Confused about usage of register: R1 in 'UnsetPending'

    if (this_sigattrlog[3]).utf8p2 ~= nil then
      (bm.add_related_string)("picus_psexec", (string.lower)((this_sigattrlog[3]).utf8p2), bm.RelatedStringBMReport)
    end
    add_parents()
    TrackPidAndTechniqueBM("BM", "T1569.002", "picus_psexec_simulation")
    return mp.INFECTED
  end
end

