local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FNAME
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_PATH
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L1_1(L2_1, L3_1)
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
L2_1 = normalize_path
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L0_1 = L2_1
L2_1 = nil
L3_1 = mp
L3_1 = L3_1.get_mpattribute
L4_1 = "RPF:AnyFileHasIOAVURL"
L3_1 = L3_1(L4_1)
if L3_1 then
  L2_1 = "IOAV"
end
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.get_contextdata
  L4_1 = mp
  L4_1 = L4_1.CONTEXT_DATA_HAS_MOTW_ADS
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.GetMOTWZone
    L3_1 = L3_1()
    if 3 <= L3_1 then
      L2_1 = "HasMotW"
    end
  end
end
if L2_1 == nil then
  L4_1 = L0_1
  L3_1 = L0_1.find
  L5_1 = "\\downloads"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 ~= nil then
    L3_1 = mp
    L3_1 = L3_1.get_contextdata
    L4_1 = mp
    L4_1 = L4_1.CONTEXT_DATA_SCANREASON
    L3_1 = L3_1(L4_1)
    L4_1 = mp
    L4_1 = L4_1.SCANREASON_ONMODIFIEDHANDLECLOSE
    if L3_1 == L4_1 then
      L2_1 = "GenericDownload"
      L4_1 = mp
      L4_1 = L4_1.set_mpattribute
      L5_1 = "MpDisableCaching"
      L4_1(L5_1)
      L4_1 = string
      L4_1 = L4_1.lower
      L5_1 = mp
      L5_1 = L5_1.get_contextdata
      L6_1 = mp
      L6_1 = L6_1.CONTEXT_DATA_PROCESSNAME
      L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L5_1(L6_1)
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
      if L4_1 == "firefox.exe" then
        L2_1 = "FirefoxDownload"
      elseif L4_1 == "thirdpartypatch.exe" then
        L2_1 = nil
      end
    end
  end
end
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.get_mpattribute
L4_1 = "Lua:ZipEncrypted"
L3_1 = L3_1(L4_1)
if L3_1 then
  L3_1 = L2_1
  L4_1 = "Encrypted"
  L2_1 = L3_1 .. L4_1
else
  L3_1 = mp
  L3_1 = L3_1.get_mpattribute
  L4_1 = "BRUTE:ZipFileExtStringInHeader"
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    L3_1 = mp
    L3_1 = L3_1.get_mpattribute
    L4_1 = "BRUTE:ZipFileExtStringInFooter"
    L3_1 = L3_1(L4_1)
    if not L3_1 then
      goto lbl_111
    end
  end
  L3_1 = L2_1
  L4_1 = "HasZip"
  L2_1 = L3_1 .. L4_1
end
::lbl_111::
L3_1 = mp
L3_1 = L3_1.set_mpattribute
L4_1 = "Lua:InterestingZip_"
L5_1 = L2_1
L4_1 = L4_1 .. L5_1
L3_1(L4_1)
L3_1 = "ArchiveTracker"
L4_1 = L0_1
L5_1 = "\\"
L6_1 = L1_1
L4_1 = L4_1 .. L5_1 .. L6_1
L5_1 = AppendToRollingQueueNamespaced
L6_1 = "InterestingZip.A"
L7_1 = L3_1
L8_1 = L4_1
L9_1 = L2_1
L10_1 = 600
L5_1(L6_1, L7_1, L8_1, L9_1, L10_1)
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
