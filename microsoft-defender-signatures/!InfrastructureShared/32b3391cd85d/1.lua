-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3391cd85d\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil then
  local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4 = nil
else
  do
    do return mp.CLEAN end
    -- DECOMPILER ERROR at PC19: Confused about usage of register: R0 in 'UnsetPending'

    ;
    (bm.add_related_file)(l_0_0)
    TrackPidAndTechniqueBM("BM", "T1570", "LateralMovement_LateralToolTransfer_FTPFileDrop")
    addRelatedProcess()
    reportRelatedBmHits()
    return mp.INFECTED
  end
end

