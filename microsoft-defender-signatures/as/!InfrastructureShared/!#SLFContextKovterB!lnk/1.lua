-- Threat: !InfrastructureShared
-- Name: !#SLF:Context/Kovter.B!lnk
-- Type: 13
-- MpAttributes: SCRIPT:MshtaString & BM_LNK_FILE & Lua:FileInStartupFolder & SCRIPT:JavascriptString

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if (l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE) and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
  if l_0_1 ~= nil then
    MpCommon.RequestSmsOnProcess(l_0_1, MpCommon.SMS_SCAN_MED)
  end
  return mp.INFECTED
end
return mp.CLEAN
