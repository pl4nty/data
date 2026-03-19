-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\108b3a6c6274c\1.luac 

-- params : ...
-- function num : 0
if not IsDeviceHVA() then
  return mp.CLEAN
end
if not (this_sigattrlog[4]).matched or (this_sigattrlog[4]).utf8p2 == nil then
  return mp.CLEAN
end
if not (this_sigattrlog[5]).matched or (this_sigattrlog[5]).utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = (this_sigattrlog[4]).utf8p2
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0 ~= 389 and l_0_0 ~= 636 and l_0_0 ~= 88 then
  return mp.CLEAN
end
local l_0_1 = (string.lower)((this_sigattrlog[5]).utf8p1)
local l_0_2 = {}
-- DECOMPILER ERROR at PC60: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC61: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC62: Overwrote pending register: R4 in 'AssignReg'

for l_0_6,l_0_7 in ("/etc/ssl/")("/etc/pki/") do
  if (string.find)(l_0_1, l_0_7, 1, true) then
    return mp.CLEAN
  end
end
;
(bm.add_related_file)(l_0_1)
add_parents()
TrackPidAndTechniqueBM("BM", "T1649", "python_cert_abuse_linux")
return mp.INFECTED

