-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\9bcb344c204d3\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[45]).matched and (this_sigattrlog[45]).utf8p1 ~= nil then
    local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4, l_0_5, l_0_6 = nil
  else
  end
  -- DECOMPILER ERROR at PC30: Confused about usage of register: R0 in 'UnsetPending'

  if not (this_sigattrlog[46]).matched or (this_sigattrlog[46]).utf8p1 == nil or (this_sigattrlog[46]).utf8p1 ~= nil then
    taint((this_sigattrlog[46]).utf8p1, "remote_file_created_taint", 3600)
    TrackPidAndTechniqueBM("BM", "T1105", "CommandAndControl_IngressToolTransfer__RemoteFileCopy.A")
    -- DECOMPILER ERROR at PC42: Confused about usage of register: R0 in 'UnsetPending'

    ;
    (bm.trigger_sig)("RemoteFileCopy", (this_sigattrlog[46]).utf8p1)
    return mp.INFECTED
  end
  return mp.CLEAN
end

