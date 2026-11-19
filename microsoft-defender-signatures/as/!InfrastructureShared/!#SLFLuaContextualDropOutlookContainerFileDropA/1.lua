-- Threat: !InfrastructureShared
-- Name: !#SLF:LuaContextualDropOutlookContainerFileDrop.A
-- Type: 13
-- Includes: GetEmailPaths
-- MpAttributes: MpOnModifiedCloseRtpScan

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  local l_0_2 = {
    [".iso"] = "",
    [".vhd"] = "",
    vhdx = "",
    ppkg = ""
  }
  if l_0_2[string.sub(l_0_1, -4)] and isOutlookProcess() then
    return mp.INFECTED
  end
end
return mp.CLEAN
