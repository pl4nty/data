-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win64/MidMess.A!dha
-- Type: 13
-- MpAttributes: BM_MZ_FILE & LUA:FileSizeGT12M.A

local l_0_0 = mp.getfilesize()
if l_0_0 < 16777216 then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN then
  if mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) then
    local l_0_1 = mp.GetMOTWHostUrl()
    if l_0_1 ~= nil and string.len(l_0_1) > 50 and l_0_1:find("www.outputmessenger.com/OutputMessengerSetup_64bit.zip", 1, true) then
      return mp.INFECTED
    end
  end
  local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if l_0_2 == "outputmessengersetup_64bit.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
