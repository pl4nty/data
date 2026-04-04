-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c9b3f1e3fd20\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[1]).matched then
  return mp.CLEAN
end
if not (this_sigattrlog[3]).matched or (this_sigattrlog[3]).utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = (string.lower)((this_sigattrlog[3]).utf8p1)
local l_0_1 = {}
-- DECOMPILER ERROR at PC36: No list found for R1 , SetList fails

local l_0_2 = false
-- DECOMPILER ERROR at PC38: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC39: Overwrote pending register: R4 in 'AssignReg'

for l_0_6,l_0_7 in ("\\temp\\")("\\tmp\\") do
  -- DECOMPILER ERROR at PC42: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC44: Overwrote pending register: R9 in 'AssignReg'

  if (("\\programdata\\").find)("\\public\\", l_0_7, 1, true) then
    break
  end
end
do
  if not l_0_2 then
    return mp.CLEAN
  end
  if (string.find)(l_0_0, "\\windows\\system32\\", 1, true) then
    return mp.CLEAN
  end
  if (string.find)(l_0_0, "\\windows\\syswow64\\", 1, true) then
    return mp.CLEAN
  end
  ;
  (bm.add_related_file)((this_sigattrlog[3]).utf8p1)
  add_parents()
  TrackPidAndTechniqueBM("BM", "T1218.002", "SuspCplSideload")
  return mp.INFECTED
end

