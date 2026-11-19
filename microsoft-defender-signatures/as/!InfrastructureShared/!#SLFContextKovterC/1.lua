-- Threat: !InfrastructureShared
-- Name: !#SLF:Context/Kovter.C
-- Type: 13
-- MpAttributes: MpOnOpenOrCloseRtpScan & BM_UNKNOWN_FILE & BM_UnknownFileExtension

if mp.get_mpattribute("Lua:ContextFileInFirstFolder.B!appdata") or mp.get_mpattribute("Lua:ContextFileInFirstFolder.B!localappdata") or mp.get_mpattribute("Lua:ContextFileInFirstFolder.B!locallowappdata") then
  local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  if l_0_0 == nil or string.find(l_0_0, "\\temp\\", 1, true) or string.find(l_0_0, " ", 1, true) then
    return mp.CLEAN
  end
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if l_0_1 == nil or string.len(l_0_1) < 5 then
    return mp.CLEAN
  end
  local l_0_2 = string.match(l_0_1, "([^\\%.]+)$")
  if string.len(l_0_2) <= 3 then
    return mp.CLEAN
  end
  local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
  if (l_0_3 == mp.SCANREASON_ONOPEN or l_0_3 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE) and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
    local l_0_4 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
    if l_0_4 ~= nil then
      MpCommon.RequestSmsOnProcess(l_0_4, MpCommon.SMS_SCAN_MED)
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
