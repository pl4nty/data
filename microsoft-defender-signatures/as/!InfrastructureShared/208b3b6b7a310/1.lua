-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\208b3b6b7a310\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = (string.lower)((this_sigattrlog[2]).utf8p1)
local l_0_1 = (bm.get_imagepath)()
if isnull(l_0_1) then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if (string.find)(l_0_1, "\\windows defender\\msmpeng.exe", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_1, "\\explorer.exe", 1, true) then
  return mp.CLEAN
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC66: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC67: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC68: Overwrote pending register: R4 in 'AssignReg'

for l_0_6,l_0_7 in ("\\horizonclipboard.exe")("\\vmware-view\\") do
  -- DECOMPILER ERROR at PC71: Overwrote pending register: R8 in 'AssignReg'

  if (("\\wfica32.exe").find)(l_0_1, l_0_7, 1, true) then
    return mp.CLEAN
  end
end
if (mp.IsKnownFriendlyFile)((this_sigattrlog[2]).utf8p1, true, false) then
  return mp.CLEAN
end
local l_0_8 = false
local l_0_9 = {}
-- DECOMPILER ERROR at PC107: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC108: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC109: Overwrote pending register: R6 in 'AssignReg'

for l_0_13,l_0_14 in ("\\temp\\")("\\tmp\\") do
  -- DECOMPILER ERROR at PC112: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC114: Overwrote pending register: R11 in 'AssignReg'

  if (("\\windows\\tasks\\").find)("\\perflogs\\", l_0_14, 1, true) then
    break
  end
end
do
  do
    if not l_0_8 then
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

