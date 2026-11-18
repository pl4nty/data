-- Threat: !InfrastructureShared
-- Name: !#TEL:TrojanDownloader:Win64/BatLoader.E
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:ZIPExt

local l_0_0 = mp.getfilesize()
if 100000000 < l_0_0 and l_0_0 < 135000000 then
  if mp.readu_u32(headerpage, 1) ~= 67324752 then
    return mp.CLEAN
  end
  mp.readprotection(false)
  local l_0_1 = 276
  local l_0_2 = mp.readfile(l_0_0 - l_0_1, l_0_1)
  mp.readprotection(true)
  if l_0_2 == nil then
    return mp.CLEAN
  end
  local l_0_3 = string.find(l_0_2, ".msi", 1, true)
  if l_0_3 == nil then
    return mp.CLEAN
  end
  if mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) ~= true then
    return mp.CLEAN
  end
  if mp.GetMOTWZone() < 3 then
    return mp.CLEAN
  end
  local l_0_4 = mp.GetMOTWHostUrl()
  if l_0_4 ~= nil and (string.find(l_0_4, "4sync.com", 1, true) or string.find(l_0_4, "4shared.com", 1, true)) then
    return mp.INFECTED
  end
end
return mp.CLEAN
