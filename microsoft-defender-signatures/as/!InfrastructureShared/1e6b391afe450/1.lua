-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1e6b391afe450\1.luac 

-- params : ...
-- function num : 0
do
  local l_0_0 = (MpCommon.PathToWin32Path)((bm.get_imagepath)()) or ""
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_1 = (string.lower)(l_0_0)
  if l_0_1 == "" then
    return mp.CLEAN
  end
  if (string.find)(l_0_1, "\\bun-dl-", 1, true) then
    (bm.add_related_string)("BunTokenTheftParent", l_0_1, bm.RelatedStringBMReport)
    TrackPidAndTechniqueBM("BM", "T1528", "npm_bun_token_theft")
    add_parents()
    local l_0_2, l_0_3 = pcall(reportBmInfo)
    if not l_0_2 and l_0_3 then
      (bm.add_related_string)("bmInfoFailReason", tostring(l_0_3), bm.RelatedStringBMReport)
    end
    return mp.INFECTED
  end
  do
    return mp.CLEAN
  end
end

