-- Threat: !InfrastructureShared
-- Name: !#Lua:HtaInsideZipBySlack.A
-- Type: 13
-- MpAttributes: MpOnOpenOrCloseRtpScan & Lua:HTAExt

local l_0_0, l_0_1 = mp.UfsGetMetadataBool("Lua:FileInZip", true)
if l_0_0 ~= 0 or not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_2 == mp.SCANREASON_ONOPEN or l_0_2 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_3 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
  if l_0_3 == "slack.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
