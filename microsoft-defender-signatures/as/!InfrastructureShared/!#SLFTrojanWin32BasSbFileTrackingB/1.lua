-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanWin32BasSbFileTrackingB\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = (versioning.GetOrgID)()
if l_0_1 == nil or type(l_0_1) ~= "string" then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if l_0_1 ~= "64eacc49-6a31-42c6-9b39-c3d9148e65f4" and l_0_1 ~= "0d5a49d5-57c7-40c0-ab8b-3a066e83b05a" and l_0_1 ~= "d7c7c745-195f-4223-9c7a-99fb420fd000" and (MpCommon.IsSampled)(80000, false, false, false) ~= true then
  return mp.CLEAN
end
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
l_0_2 = (string.lower)(l_0_2)
local l_0_3 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
l_0_3 = (MpCommon.PathToWin32Path)(l_0_3)
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
l_0_3 = (string.lower)(l_0_3)
local l_0_4 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_4 == nil or l_0_4 == "" then
  return mp.CLEAN
end
local l_0_5 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_5 == nil then
  return mp.CLEAN
end
l_0_5 = (string.lower)(l_0_5)
local l_0_6 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
if l_0_6 == nil or l_0_6 == "" then
  return mp.CLEAN
end
local l_0_7 = (MpCommon.PathToWin32Path)(l_0_6)
if l_0_7 == nil then
  return mp.CLEAN
end
local l_0_8 = (string.lower)(l_0_7 .. "\\" .. l_0_5)
local l_0_9 = (string.lower)(l_0_4 .. "\\" .. l_0_8)
if (GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_OriginalProcs_Tel", l_0_9) or GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_OriginalExecFiles_Tel", l_0_8) or (l_0_5 ~= "sbsimulator.exe" and (string.find)(l_0_5, "sbsimulation_sb_%d+_bs_%d+_gold%.exe") == nil and (string.find)(l_0_5, "sbsimulation_sb_%d+_bs_%d+_red%.exe") == nil and (string.find)(l_0_5, "sbsimulation_sb_%d+_bs_%d+_green%.exe") == nil) or (string.find)(l_0_8, "^[a-z]:\\program files\\safebreach\\") ~= nil) then
  AddRqKeyAndValueNS("BAS_SB_Coverage", "BAS_SB_OriginalProcs_Tel", l_0_9, "1")
  if AddRqKeyAndValueNS("BAS_SB_Coverage", "BAS_SB_RelatedNonExecFiles_Tel", l_0_3, "1") then
    (mp.set_mpattribute)("MpDisableMOACSyncInsert")
    ;
    (mp.set_mpattribute)("MpDisableCaching")
    return mp.INFECTED
  end
else
  if GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_RelatedProcs_Tel", l_0_9) or GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_RelatedExecFiles_Tel", l_0_8) then
    AddRqKeyAndValueNS("BAS_SB_Coverage", "BAS_SB_RelatedProcs_Tel", l_0_9, "1")
    if AddRqKeyAndValueNS("BAS_SB_Coverage", "BAS_SB_RelatedNonExecFiles_Tel", l_0_3, "1") then
      (mp.set_mpattribute)("MpDisableMOACSyncInsert")
      ;
      (mp.set_mpattribute)("MpDisableCaching")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN

