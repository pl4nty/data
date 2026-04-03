-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\10ab3a7a61129\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[1]).matched or not (this_sigattrlog[2]).matched or not (this_sigattrlog[3]).matched then
  return mp.CLEAN
end
if (this_sigattrlog[1]).utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = (string.lower)((this_sigattrlog[1]).utf8p1)
if (string.find)(l_0_0, "\\node_modules\\", 1, true) then
  return mp.CLEAN
end
local l_0_1 = (bm.get_imagepath)()
if isnull(l_0_1) then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if (string.find)(l_0_1, "\\windows defender\\msmpeng.exe", 1, true) then
  return mp.CLEAN
end
do
  local l_0_2 = {}
  -- DECOMPILER ERROR at PC104: No list found for R2 , SetList fails

  -- DECOMPILER ERROR at PC105: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC106: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC107: Overwrote pending register: R5 in 'AssignReg'

  if ("\\microsoft teams\\")("\\teams\\", "\\microsoft\\teams\\", true) then
    return mp.CLEAN
  end
  ;
  (bm.add_related_string)("loki_c2_proc", l_0_1, bm.RelatedStringBMReport)
  ;
  (bm.add_related_string)("loki_c2_nodemod", l_0_0, bm.RelatedStringBMReport)
  if (this_sigattrlog[3]).utf8p1 then
    (bm.add_related_string)("loki_c2_action", (this_sigattrlog[3]).utf8p1, bm.RelatedStringBMReport)
  end
  add_parents()
  TrackPidAndTechniqueBM("BM", "T1059.007", "LokiC2Beacon")
  TrackPidAndTechniqueBM("BM", "T1071.001", "LokiC2Comms")
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

