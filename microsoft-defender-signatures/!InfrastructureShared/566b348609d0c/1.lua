-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\566b348609d0c\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_0.ppid, true) then
  return mp.CLEAN
end
local l_0_1 = nil
if (this_sigattrlog[26]).matched and (this_sigattrlog[26]).utf8p1 ~= nil then
  l_0_1 = (string.lower)((this_sigattrlog[26]).utf8p1)
else
  if (this_sigattrlog[27]).matched and (this_sigattrlog[27]).utf8p1 ~= nil then
    l_0_1 = (string.lower)((this_sigattrlog[27]).utf8p1)
  end
end
if l_0_1 == nil or #l_0_1 < 9 then
  return mp.CLEAN
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC69: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC70: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC71: Overwrote pending register: R4 in 'AssignReg'

for l_0_6,l_0_7 in ("/insights-client")("/kdump") do
  if (string.find)(l_0_1, l_0_7, 1, true) then
    return mp.CLEAN
  end
end
addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1569", "Execution_SystemServices")
;
(bm.add_related_string)("file_metadata", l_0_1, bm.RelatedStringBMReport)
return mp.INFECTED

