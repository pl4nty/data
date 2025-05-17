-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaTriggerAttackIQResourceScanA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (MpCommon.AtomicCounterValue)("TriggerAttackIQResourceScan")
if l_0_0 then
  return mp.CLEAN
end
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if (mp.get_contextdata)(mp.CONTEXT_DATA_NEWLYCREATEDHINT) ~= true then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = (MpCommon.PathToWin32Path)(l_0_1)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = (string.lower)(l_0_1)
local l_0_3 = {}
-- DECOMPILER ERROR at PC66: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC67: Overwrote pending register: R4 in 'AssignReg'

if ("\\attackiq\\agent\\scenarios\\")(l_0_2, l_0_3) then
  (mp.TriggerScanResource)("folder", l_0_2)
  ;
  (MpCommon.AtomicCounterSet)("TriggerAttackIQResourceScan", 1, 3600)
  return mp.INFECTED
end
return mp.CLEAN

