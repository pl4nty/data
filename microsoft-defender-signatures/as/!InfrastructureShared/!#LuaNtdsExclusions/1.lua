local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 2097152 then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FNAME
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_PATH
L3_1 = L3_1(L4_1, L5_1)
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L2_1(L3_1, L4_1)
L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
L4_1 = L2_1
L3_1 = L2_1.sub
L5_1 = -3
L3_1 = L3_1(L4_1, L5_1)
L4_1 = "tdb|edb|mdb|dat|ore|pds|sdb|bim|vol|asf|adb|tmp"
L6_1 = L4_1
L5_1 = L4_1.find
L7_1 = L3_1
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = "catdb|mail.msmessagestore|dhcp.mdb|webcachev01.dat|cachestorage.edb|windowsmail.msmessagestore|defaultstore|actorstatestore|persiststore.edb|imosstore|fs.edb|rm.edb|upgradeservicestore|serverservice.edb|masterservice.edb|6260B5C4|"
L7_1 = L5_1
L6_1 = L5_1.find
L8_1 = L2_1
L9_1 = 1
L10_1 = true
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L7_1 = L1_1
L6_1 = L1_1.find
L8_1 = "\\webcache\\"
L9_1 = 1
L10_1 = true
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
if not L6_1 then
  L7_1 = L1_1
  L6_1 = L1_1.find
  L8_1 = "\\system32\\logfiles"
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if not L6_1 then
    L7_1 = L1_1
    L6_1 = L1_1.find
    L8_1 = "windows\\cryptoguard"
    L9_1 = 1
    L10_1 = true
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    if not L6_1 then
      goto lbl_73
    end
  end
end
L6_1 = mp
L6_1 = L6_1.INFECTED
do return L6_1 end
::lbl_73::
L6_1 = pcall
L7_1 = mp
L7_1 = L7_1.BMSearchFile
L8_1 = 4096
L9_1 = 2097152
L10_1 = "ATTk590689\144\000"
L6_1, L7_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
if L6_1 and 4096 < L7_1 then
  L8_1 = mp
  L8_1 = L8_1.set_mpattribute
  L9_1 = "Lua:NtdsditEsedbFileHeader.A"
  L8_1(L9_1)
  L8_1 = mp
  L8_1 = L8_1.set_mpattribute
  L9_1 = "BM_Ntdsdit_ESEDB_FILE"
  L8_1(L9_1)
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = mp
L8_1 = L8_1.INFECTED
return L8_1
