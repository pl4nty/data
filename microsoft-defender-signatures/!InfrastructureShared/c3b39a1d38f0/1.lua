-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c3b39a1d38f0\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil and (this_sigattrlog[1]).utf8p2 ~= nil then
  local l_0_0 = (string.lower)((this_sigattrlog[1]).utf8p1)
  local l_0_1 = (string.lower)((this_sigattrlog[1]).utf8p2)
  local l_0_2 = l_0_1:match("remoteip:([^;]+)")
  if (l_0_2 ~= nil or l_0_2 ~= "" or l_0_2 ~= ";fsize") and l_0_0 ~= "" then
    TrackAttackerServer(l_0_2, 5000)
    l_0_0 = (string.lower)((MpCommon.PathToWin32Path)(l_0_0))
    local l_0_3 = {}
    -- DECOMPILER ERROR at PC53: No list found for R3 , SetList fails

    -- DECOMPILER ERROR at PC54: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC55: Overwrote pending register: R5 in 'AssignReg'

    ;
    ("T1570:remote_dropped_FePyCompiledBin")("T1021.002:remote_dropped_FePyCompiledBin", l_0_3)
    AddResearchData("BM", true)
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

