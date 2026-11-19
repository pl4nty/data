-- Threat: !InfrastructureShared
-- Name: !#TEL:TrojanDownloader:Win64/BatLoader.D
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:MSIExt

local l_0_0 = mp.getfilesize()
if 100000000 < l_0_0 and l_0_0 < 135000000 then
  if mp.readu_u64(headerpage, 1) ~= -2226271756974174256 then
    return mp.CLEAN
  end
  if mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) ~= true then
    return mp.CLEAN
  end
  if mp.GetMOTWZone() < 3 then
    return mp.CLEAN
  end
  local l_0_1 = mp.GetMOTWHostUrl()
  if l_0_1 ~= nil and (string.find(l_0_1, "4sync.com", 1, true) or string.find(l_0_1, "4shared.com", 1, true)) then
    return mp.INFECTED
  end
end
return mp.CLEAN
