-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb3eaedb811\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[2]).matched or isnull((this_sigattrlog[2]).utf8p2) then
  return mp.CLEAN
end
local l_0_0 = (string.lower)((this_sigattrlog[2]).utf8p2)
if not (string.find)(l_0_0, "\\appdata\\local\\", 1, true) and not (string.find)(l_0_0, "%localappdata%", 1, true) then
  return mp.CLEAN
end
local l_0_1 = {}
-- DECOMPILER ERROR at PC57: No list found for R1 , SetList fails

-- DECOMPILER ERROR at PC58: Overwrote pending register: R2 in 'AssignReg'

local l_0_2 = "gatherosstate"
-- DECOMPILER ERROR at PC59: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC60: Overwrote pending register: R4 in 'AssignReg'

for l_0_6,l_0_7 in ("windows update")("windowsupdate") do
  -- DECOMPILER ERROR at PC63: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC65: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC66: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC67: Overwrote pending register: R11 in 'AssignReg'

  if (("windows setup").find)("windows security", "windows servicing", "windows telemetry", true) then
    break
  end
end
do
  if isnull(l_0_2) then
    return mp.CLEAN
  end
  if is_excluded_parent_proc_auto() then
    return mp.CLEAN
  end
  ;
  (bm.add_related_string)("RUNKEY_VALUE", (this_sigattrlog[2]).utf8p2, bm.RelatedStringBMReport)
  ;
  (bm.add_related_string)("MASQUERADE_TOKEN", l_0_2, bm.RelatedStringBMReport)
  bm_AddRelatedFileFromCommandLine(l_0_0, nil, nil, 1)
  do
    local l_0_8 = (bm.get_imagepath)()
    if l_0_8 then
      (bm.add_related_file)(l_0_8)
    end
    add_parents()
    TrackPidAndTechniqueBM("BM", "T1547.001", "AntinoStagedPersistence.AM")
    do return mp.INFECTED end
    -- WARNING: undefined locals caused missing assignments!
  end
end

