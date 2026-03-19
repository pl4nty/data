-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\131b3ff0e2dbd\1.luac 

-- params : ...
-- function num : 0
if not IsDeviceHVA() then
  return mp.CLEAN
end
if not (this_sigattrlog[5]).matched or (this_sigattrlog[5]).utf8p2 == nil then
  return mp.CLEAN
end
if not (this_sigattrlog[6]).matched or (this_sigattrlog[6]).utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = (this_sigattrlog[5]).utf8p2
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0 ~= 389 and l_0_0 ~= 636 and l_0_0 ~= 88 then
  return mp.CLEAN
end
local l_0_1 = (string.lower)((this_sigattrlog[6]).utf8p1)
local l_0_2 = {}
-- DECOMPILER ERROR at PC60: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC61: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC62: Overwrote pending register: R4 in 'AssignReg'

for l_0_6,l_0_7 in ("\\windows\\system32\\")("\\programdata\\microsoft\\crypto\\") do
  if (string.find)(l_0_1, l_0_7, 1, true) then
    return mp.CLEAN
  end
end
local l_0_8 = (bm.get_imagepath)()
if isnull(l_0_8) then
  return mp.CLEAN
end
l_0_8 = (string.lower)(l_0_8)
if (string.find)(l_0_8, "\\windows defender\\msmpeng.exe", 1, true) then
  return mp.CLEAN
end
;
(bm.add_related_file)(l_0_1)
add_parents()
TrackPidAndTechniqueBM("BM", "T1649", "python_cert_abuse")
return mp.INFECTED

