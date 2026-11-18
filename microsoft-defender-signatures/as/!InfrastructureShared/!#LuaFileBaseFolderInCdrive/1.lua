-- Threat: !InfrastructureShared
-- Name: !#Lua:FileBaseFolderInCdrive
-- Type: 12
-- MpAttributes: MpOnOpenOrCloseRtpScan

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
if l_0_0 ~= nil and l_0_0:len() > 5 then
  local l_0_1 = string.lower(l_0_0)
  if l_0_0:len() > 8 and string.sub(l_0_0, 1, 8) == "\\device\\" then
    l_0_1 = string.lower(MpCommon.PathToWin32Path(l_0_0))
  end
  if l_0_1:len() == 6 then
    if l_0_1 == "\\\\?\\c:" then
      return mp.INFECTED
    else
      mp.set_mpattribute("Lua:FileBaseFolderInOtherDrive")
    end
  end
end
return mp.CLEAN
