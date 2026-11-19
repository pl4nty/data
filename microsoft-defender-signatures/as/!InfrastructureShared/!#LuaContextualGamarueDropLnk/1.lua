-- Threat: !InfrastructureShared
-- Name: !#Lua:ContextualGamarueDropLnk
-- Type: 13
-- MpAttributes: MpOnOpenOrCloseRtpScan

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if l_0_1:find("%(%d+gb%)%.lnk", 1, false) and string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)) == "msiexec.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
