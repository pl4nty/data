-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1dfb3b31902b0\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[1]).matched or (this_sigattrlog[1]).utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = (string.lower)((this_sigattrlog[1]).utf8p1)
local l_0_1 = (bm.get_imagepath)()
if isnull(l_0_1) then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if (string.find)(l_0_1, "\\windows defender\\msmpeng.exe", 1, true) then
  return mp.CLEAN
end
if (mp.IsKnownFriendlyFile)((this_sigattrlog[1]).utf8p1, true, false) then
  return mp.CLEAN
end
local l_0_2 = false
local l_0_3 = {}
-- DECOMPILER ERROR at PC69: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC70: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC71: Overwrote pending register: R5 in 'AssignReg'

for l_0_7,l_0_8 in ("\\temp\\")("\\tmp\\") do
  -- DECOMPILER ERROR at PC74: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC76: Overwrote pending register: R10 in 'AssignReg'

  if (("\\windows\\tasks\\").find)("\\perflogs\\", l_0_8, 1, true) then
    break
  end
end
do
  do
    if not l_0_2 then
      return mp.CLEAN
    end
    ;
    (bm.add_related_string)("rdp_reupload_file", l_0_0, bm.RelatedStringBMReport)
    ;
    (bm.add_related_string)("rdp_reupload_proc", l_0_1, bm.RelatedStringBMReport)
    add_parents()
    TrackPidAndTechniqueBM("BM", "T1021.001", "SuspRdpReupload")
    do return mp.INFECTED end
    -- WARNING: undefined locals caused missing assignments!
  end
end

