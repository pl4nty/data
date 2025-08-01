-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFSuspiciousSectionPEA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "ExecutableNonTextSection"
local l_0_1 = {}
if pehdr.NumberOfSections <= 1 then
  return mp.CLEAN
end
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
local l_0_3 = (MpCommon.PathToWin32Path)((mp.getfilename)())
if not l_0_2 or not l_0_3 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
for l_0_7 = 1, pehdr.NumberOfSections do
  if (pesecs[l_0_7]).Name ~= ".text" and (pesecs[l_0_7]).Characteristics == 1610612768 then
    local l_0_8 = (mp.readfile)((pesecs[l_0_7]).PointerToRawData, (pesecs[l_0_7]).SizeOfRawData)
    if l_0_8 ~= nil and #l_0_8 > 256 and (mp.readu_u16)(l_0_8, 1) == 23117 then
      (mp.vfo_add_buffer)(l_0_8, (string.format)("%s_%s", l_0_0, (pesecs[l_0_7]).Name), mp.ADD_VFO_TAKE_ACTION_ON_DAD)
      ;
      (table.insert)(l_0_1, (string.format)("%s_%d", (pesecs[l_0_7]).Name, (pesecs[l_0_7]).SizeOfRawData))
      ;
      (MpCommon.BmTriggerSig)(l_0_2, (string.format)("BM_%s_OriginalPath:%s_OriginalSection:%s", l_0_0, l_0_3, (pesecs[l_0_7]).Name), (string.format)("UsrName:;Domain:;RemoteIp:;FSize:%d", (pesecs[l_0_7]).SizeOfRawData))
    end
  end
end
;
(mp.readprotection)(true)
if #l_0_1 == 0 then
  return mp.CLEAN
end
local l_0_9 = (table.concat)(l_0_1, ",")
;
(mp.set_mpattribute)((string.format)("%s_Sections=%s", l_0_0, l_0_9))
AppendToRollingQueue(l_0_0, l_0_3, l_0_9)
return mp.INFECTED

