-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#InterestingZipA\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
l_0_0 = normalize_path(l_0_0)
local l_0_2 = nil
if (mp.get_mpattribute)("RPF:AnyFileHasIOAVURL") then
  l_0_2 = "IOAV"
end
if l_0_2 == nil and (mp.get_contextdata)(mp.CONTEXT_DATA_HAS_MOTW_ADS) and (mp.GetMOTWZone)() >= 3 then
  l_0_2 = "HasMotW"
end
if l_0_2 == nil and l_0_0:find("\\downloads", 1, true) ~= nil then
  local l_0_3 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
  if l_0_3 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
    l_0_2 = "GenericDownload"
    ;
    (mp.set_mpattribute)("MpDisableCaching")
    local l_0_4 = (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME))
    if l_0_4 == "firefox.exe" then
      l_0_2 = "FirefoxDownload"
    else
      if l_0_4 == "thirdpartypatch.exe" then
        l_0_2 = nil
      end
    end
  end
end
do
  if l_0_2 == nil then
    return mp.CLEAN
  end
  if (mp.get_mpattribute)("AGGR:Lua:ZipEncrypted") then
    l_0_2 = l_0_2 .. "Encrypted"
  else
    if (mp.get_mpattribute)("BRUTE:ZipFileExtStringInHeader") or (mp.get_mpattribute)("BRUTE:ZipFileExtStringInFooter") then
      l_0_2 = l_0_2 .. "HasZip"
    end
  end
  ;
  (mp.set_mpattribute)("Lua:InterestingZip_" .. l_0_2)
  local l_0_5 = "ArchiveTracker"
  local l_0_6 = l_0_0 .. "\\" .. l_0_1
  AppendToRollingQueueNamespaced("InterestingZip.A", l_0_5, l_0_6, l_0_2, 600)
  return mp.CLEAN
end

