-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c5b351b8e27e\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[1]).matched then
  return mp.CLEAN
end
if not (this_sigattrlog[5]).matched then
  return mp.CLEAN
end
local l_0_0 = (bm.get_imagepath)()
if isnull(l_0_0) then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
if (string.find)(l_0_0, "\\windows defender\\msmpeng.exe", 1, true) then
  return mp.CLEAN
end
local l_0_1 = {}
-- DECOMPILER ERROR at PC49: No list found for R1 , SetList fails

-- DECOMPILER ERROR at PC50: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC51: Overwrote pending register: R3 in 'AssignReg'

for l_0_5,l_0_6 in ("\\msbuild.exe")("\\devenv.exe") do
  if (string.find)(l_0_0, l_0_6, 1, true) then
    return mp.CLEAN
  end
end
;
(bm.add_related_string)("cad_exec_proc", l_0_0, bm.RelatedStringBMReport)
add_parents()
TrackPidAndTechniqueBM("BM", "T1127.001", "SuspCompiledPayloadExec")
return mp.INFECTED

