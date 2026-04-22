-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb3ec04f02f\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[1]).matched and not (this_sigattrlog[2]).matched then
  return mp.CLEAN
end
local l_0_0 = (bm.get_imagepath)()
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
local l_0_1 = {}
-- DECOMPILER ERROR at PC31: No list found for R1 , SetList fails

-- DECOMPILER ERROR at PC32: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC33: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC34: Overwrote pending register: R4 in 'AssignReg'

if ("\\systemsettings.exe")("\\windowsterminal.exe", "\\wt.exe", true) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1546.015", "COMHijacking")
return mp.INFECTED

