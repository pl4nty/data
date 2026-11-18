-- Threat: !InfrastructureShared
-- Name: !#Lua:FileInStartupFolder
-- Type: 12
-- MpAttributes: MpOnOpenOrCloseRtpScan

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
if l_0_0 ~= nil and l_0_0:len() > 28 then
  local l_0_1 = string.lower(l_0_0)
  if string.sub(l_0_1, -28) == "\\start menu\\programs\\startup" then
    if mp.get_mpattribute("BM_LNK_FILE") then
      mp.set_mpattribute("Lua:LnkFileInStartupFolder")
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
