-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\246b360af2757\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = (string.lower)((this_sigattrlog[2]).utf8p1)
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
local l_0_2 = {}
-- DECOMPILER ERROR at PC84: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC85: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC86: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC87: Overwrote pending register: R5 in 'AssignReg'

if ("\\update.exe")("\\squirrel.exe", "\\setup.exe", true) then
  return mp.CLEAN
end
if (string.find)(l_0_1, "\\system32\\svchost.exe", 1, true) and ((string.find)(l_0_0, "\\windowsapps\\", 1, true) or (string.find)(l_0_0, "\\program files\\", 1, true) or (string.find)(l_0_0, "\\program files (x86)\\", 1, true)) then
  return mp.CLEAN
end
local l_0_3 = (string.find)(l_0_0, "\\resources\\app", 1, true)
do
  do
    if l_0_3 then
      local l_0_4 = (string.sub)(l_0_0, 1, l_0_3 - 1)
      -- DECOMPILER ERROR at PC153: Overwrote pending register: R8 in 'AssignReg'

      if (string.find)(l_0_1, l_0_4, "\\windows\\system32\\msiexec.exe", true) then
        return mp.CLEAN
      end
    end
    if (mp.IsKnownFriendlyFile)(l_0_1, true, false) then
      return mp.CLEAN
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
end

