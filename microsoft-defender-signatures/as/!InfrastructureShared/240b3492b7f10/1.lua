-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\240b3492b7f10\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[9]).matched or (this_sigattrlog[9]).utf8p1 == nil or (this_sigattrlog[9]).utf8p2 == nil then
  return mp.CLEAN
end
local l_0_0 = (string.lower)((this_sigattrlog[9]).utf8p1)
local l_0_1 = (string.lower)((this_sigattrlog[9]).utf8p2)
local l_0_2 = {}
-- DECOMPILER ERROR at PC38: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC39: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC40: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC41: Overwrote pending register: R5 in 'AssignReg'

if not ("\\users\\")("\\appdata\\", "\\temp\\", true) then
  return mp.CLEAN
end
do
  local l_0_3 = (bm.get_imagepath)()
  if isnull(l_0_3) then
    return mp.CLEAN
  end
  if l_0_0 ~= (string.lower)(l_0_3) then
    return mp.CLEAN
  end
  if (mp.IsKnownFriendlyFile)(l_0_0, true, false) then
    return mp.CLEAN
  end
  ;
  (bm.add_related_file)(l_0_0)
  ;
  (bm.add_related_file)(l_0_1)
  ;
  (bm.add_related_string)("SelfCopyToSys32", l_0_1, bm.RelatedStringBMReport)
  TrackPidAndTechniqueBM("BM", "T1574.001", "DefenderCloudsPlaceholderLPE.MK")
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

