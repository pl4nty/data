-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\21db3e25fb5b9\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[1]).matched or (this_sigattrlog[1]).utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = (string.lower)((this_sigattrlog[1]).utf8p1)
if not (string.find)(l_0_0, "\\resources\\app", 1, true) then
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
  -- DECOMPILER ERROR at PC74: No list found for R2 , SetList fails

  -- DECOMPILER ERROR at PC75: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC76: Overwrote pending register: R4 in 'AssignReg'

  for l_0_6,l_0_7 in ("\\update.exe")("\\squirrel.exe") do
    -- DECOMPILER ERROR at PC79: Overwrote pending register: R8 in 'AssignReg'

    -- DECOMPILER ERROR at PC81: Overwrote pending register: R9 in 'AssignReg'

    -- DECOMPILER ERROR at PC82: Overwrote pending register: R10 in 'AssignReg'

    -- DECOMPILER ERROR at PC83: Overwrote pending register: R11 in 'AssignReg'

    if (("\\windows\\system32\\msiexec.exe").find)("\\microsoft\\edge\\", "\\windowsapps\\", "\\node.exe", true) then
      return mp.CLEAN
    end
  end
  ;
  (bm.add_related_string)("electron_scriptjack_path", l_0_0, bm.RelatedStringBMReport)
  ;
  (bm.add_related_string)("electron_scriptjack_proc", l_0_1, bm.RelatedStringBMReport)
  add_parents()
  TrackPidAndTechniqueBM("BM", "T1218.015", "ElectronScriptJack")
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

