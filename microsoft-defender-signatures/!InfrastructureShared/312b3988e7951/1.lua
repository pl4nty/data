-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\312b3988e7951\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = {}
-- DECOMPILER ERROR at PC23: No list found for R1 , SetList fails

-- DECOMPILER ERROR at PC24: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC24: Overwrote pending register: R2 in 'AssignReg'

local l_0_2 = ("\\Microsoft Office\\root\\Office")("OneDrive\\OneDrive.exe$")
-- DECOMPILER ERROR at PC27: Overwrote pending register: R4 in 'AssignReg'

for l_0_6,l_0_7 in pairs("\\bin\\PBIDesktop.exe$") do
  -- DECOMPILER ERROR at PC30: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC32: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC33: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC33: Overwrote pending register: R10 in 'AssignReg'

  if (("\\MonAgentCore.exe$").find)("\\DNF\\DNF.exe$", ("\\AutomationAnywhere.ManagedDLLWrapper.exe$")("\\GoogleDriveFS.exe$"), 1, false) then
    return mp.CLEAN
  end
end
local l_0_8, l_0_9, l_0_10, l_0_11, l_0_12 = checkFileLastWriteTime(l_0_0, 3600)
if l_0_8 == true then
  return mp.CLEAN
end
if IsLegacyOrgMachine() or IsTechniqueObservedForPid("BM", "ttexclusion") or IsTacticObservedForPid("BM", "ttexclusion") or IsTacticObservedForPid("BM", "ttexclusion_cln") then
  return mp.CLEAN
end
local l_0_13 = nil
if not (this_sigattrlog[16]).matched or isnull(l_0_13) then
  return mp.CLEAN
end
if not isPublicIP(l_0_13.DestIp) then
  return mp.CLEAN
end
local l_0_14 = (bm.GetOverallTrafficVolumes)()
if isnull(l_0_14) then
  return mp.CLEAN
end
if tonumber(l_0_13.Bout) < 1048576 or l_0_14.outgoing_req < 10485760 or tonumber(l_0_13.Bout) < tonumber(l_0_13.Bin) or l_0_14.outgoing_req < l_0_14.incoming_response then
  return mp.CLEAN
end
local l_0_15 = nil
-- DECOMPILER ERROR at PC156: Overwrote pending register: R13 in 'AssignReg'

if (this_sigattrlog[18]).matched and (this_sigattrlog[18]).utf8p1 ~= nil then
  do
    add_parents()
    reportRelatedBmHits()
    addOverallNetworkVolume()
    -- DECOMPILER ERROR at PC171: Overwrote pending register: R14 in 'AssignReg'

    ;
    (bm.add_related_string)("SuspiciosProcessAge", l_0_9, ("\\Telegram Desktop\\Telegram.exe$").RelatedStringBMReport)
    ;
    (bm.add_related_string)("SensitiveFileExt", l_0_15, bm.RelatedStringBMReport)
    TrackPidAndTechniqueBM("BM", "T1567", "ExfilOverWeb")
    do return mp.INFECTED end
    -- WARNING: undefined locals caused missing assignments!
  end
end

