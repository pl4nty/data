-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1e9b34be18e2c\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[2]).matched then
  return mp.CLEAN
end
if not (this_sigattrlog[6]).matched or (this_sigattrlog[6]).utf8p1 == nil then
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
if (mp.IsKnownFriendlyFile)(l_0_0, true, false) then
  return mp.CLEAN
end
local l_0_1 = {}
-- DECOMPILER ERROR at PC70: No list found for R1 , SetList fails

local l_0_2 = false
-- DECOMPILER ERROR at PC72: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC73: Overwrote pending register: R4 in 'AssignReg'

for l_0_6,l_0_7 in ("entrasync")("onedrive") do
  -- DECOMPILER ERROR at PC76: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC78: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC79: Overwrote pending register: R10 in 'AssignReg'

  if (("adobeupdate").find)("firefoxupdate", "code-tunnel", 1, true) then
    break
  end
end
do
  if not l_0_2 then
    return mp.CLEAN
  end
  local l_0_8 = (string.lower)((this_sigattrlog[6]).utf8p1)
  ;
  (bm.add_related_string)("masq_proc", l_0_0, bm.RelatedStringBMReport)
  ;
  (bm.add_related_string)("masq_drop", l_0_8, bm.RelatedStringBMReport)
  add_parents()
  TrackPidAndTechniqueBM("BM", "T1036.005", "SuspMasqPayloadDeploy")
  return mp.INFECTED
end

