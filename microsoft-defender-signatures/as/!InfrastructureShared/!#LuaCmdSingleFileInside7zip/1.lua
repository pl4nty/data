-- Threat: !InfrastructureShared
-- Name: !#Lua:CmdSingleFileInside7zip
-- Type: 13
-- MpAttributes: MpOnOpenOrCloseRtpScan & Lua:CMDExt

local l_0_0, l_0_1 = mp.UfsGetMetadataBool("Lua:SingleFileIn7Z!ufs", true)
if l_0_0 ~= 0 or not l_0_1 then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) == true and mp.GetMOTWZone() >= 3 then
  mp.set_mpattribute("Lua:CmdSingleFileInside7zipWithMotw")
end
return mp.INFECTED
