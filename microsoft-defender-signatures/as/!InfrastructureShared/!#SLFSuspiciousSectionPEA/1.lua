-- Threat: !InfrastructureShared
-- Name: !#SLF:SuspiciousSection.PE.A
-- Type: 10
-- Includes: LuaFuncHelper
-- MpAttributes: BM_MZ_FILE & MpTrustCheck_NotDigitallySigned

local l_0_0 = "ExecutableNonTextSection"
local l_0_1 = {}
if pehdr.NumberOfSections <= 1 then
  return mp.CLEAN
end
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
local l_0_3 = MpCommon.PathToWin32Path(mp.getfilename())
if not l_0_2 or not l_0_3 then
  return mp.CLEAN
end
mp.readprotection(false)
for l_0_4 = 1, pehdr.NumberOfSections do
  if pesecs[l_0_4].Name ~= ".text" and pesecs[l_0_4].Characteristics == 1610612768 then
    local l_0_5 = mp.readfile(pesecs[l_0_4].PointerToRawData, pesecs[l_0_4].SizeOfRawData)
    if l_0_5 ~= nil and 256 < #l_0_5 and mp.readu_u16(l_0_5, 1) == 23117 then
      mp.vfo_add_buffer(l_0_5, string.format("%s_%s", l_0_0, pesecs[l_0_4].Name), mp.ADD_VFO_TAKE_ACTION_ON_DAD)
      table.insert(l_0_1, string.format("%s_%d", pesecs[l_0_4].Name, pesecs[l_0_4].SizeOfRawData))
      MpCommon.BmTriggerSig(l_0_2, string.format("BM_%s_OriginalPath:%s_OriginalSection:%s", l_0_0, l_0_3, pesecs[l_0_4].Name), string.format("UsrName:;Domain:;RemoteIp:;FSize:%d", pesecs[l_0_4].SizeOfRawData))
    end
  end
end
mp.readprotection(true)
if #l_0_1 == 0 then
  return mp.CLEAN
end
local l_0_6 = table.concat(l_0_1, ",")
mp.set_mpattribute(string.format("%s_Sections=%s", l_0_0, l_0_6))
MpCommon.SetOriginalFileName(l_0_3, string.format("BM_%s", l_0_0))
mp.set_mpattribute("MpDisableCaching")
AppendToRollingQueue(l_0_0, l_0_3, l_0_6)
return mp.INFECTED
