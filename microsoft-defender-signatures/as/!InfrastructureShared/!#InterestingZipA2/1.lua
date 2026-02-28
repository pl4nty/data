local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
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
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L1_1(L2_1, L3_1)
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
L2_1 = normalize_path
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L0_1 = L2_1
L2_1 = nil
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
if L2_1 == nil then
  L4_1 = L0_1
  L3_1 = L0_1.find
  L5_1 = "\\downloads"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 ~= nil then
    L2_1 = "DownloadsFolder"
  end
end
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = mp
L4_1 = L4_1.get_contextdata
L5_1 = mp
L5_1 = L5_1.CONTEXT_DATA_PROCESSNAME
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L4_1(L5_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
if L3_1 == "telegram.exe" then
  L4_1 = L2_1
  L5_1 = "Telegram"
  L2_1 = L4_1 .. L5_1
else
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.set_mpattribute
L5_1 = "Lua:InterestingZip_"
L6_1 = L2_1
L5_1 = L5_1 .. L6_1
L4_1(L5_1)
L4_1 = "ArchiveTracker"
L5_1 = L0_1
L6_1 = "\\"
L7_1 = L1_1
L5_1 = L5_1 .. L6_1 .. L7_1
L6_1 = AppendToRollingQueueNamespaced
L7_1 = "InterestingZip.A"
L8_1 = L4_1
L9_1 = L5_1
L10_1 = L2_1
L11_1 = 600
L6_1(L7_1, L8_1, L9_1, L10_1, L11_1)
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
