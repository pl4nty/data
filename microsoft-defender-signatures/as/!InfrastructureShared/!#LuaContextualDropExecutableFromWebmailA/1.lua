local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.IsHipsRuleEnabled
L1_1 = "be9ba2d9-53ea-4cdc-84e5-9b1eeee46550"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = "enghipscpy:blockaccess:be9ba2d9-53ea-4cdc-84e5-9b1eeee46550"
L1_1 = mp
L1_1 = L1_1.GetScanSource
L1_1 = L1_1()
L2_1 = mp
L2_1 = L2_1.SCANSOURCE_IOAV_WEB
if L1_1 ~= L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = IsWebmailDownloadUrlIoavAndMotwV0
L2_1 = L2_1()
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.getfilename
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FNAME
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
L3_1, L4_1, L5_1, L6_1, L7_1 = L3_1(L4_1, L5_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1)
L3_1 = string
L3_1 = L3_1.len
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 < 4 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.sub
L4_1 = L2_1
L5_1 = -4
L3_1 = L3_1(L4_1, L5_1)
L4_1 = L3_1
L3_1 = L3_1.match
L5_1 = "%.(%w+)$"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = IsSuspiciousFileExt
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "MpDisableCaching"
  L4_1(L5_1)
  L4_1 = MpCommon
  L4_1 = L4_1.QueryPersistContext
  L5_1 = mp
  L5_1 = L5_1.getfilename
  L5_1 = L5_1()
  L6_1 = L0_1
  L4_1 = L4_1(L5_1, L6_1)
  if not L4_1 then
    L4_1 = MpCommon
    L4_1 = L4_1.AppendPersistContext
    L5_1 = mp
    L5_1 = L5_1.getfilename
    L5_1 = L5_1()
    L6_1 = L0_1
    L7_1 = 0
    L4_1(L5_1, L6_1, L7_1)
  end
  L4_1 = mp
  L4_1 = L4_1.SetHipsRule
  L5_1 = "be9ba2d9-53ea-4cdc-84e5-9b1eeee46550"
  L4_1(L5_1)
  L4_1 = mp
  L4_1 = L4_1.BLOCKACCESS
  return L4_1
else
  L4_1 = IsArchiveFileExt
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.set_mpattribute
    L5_1 = "MpDisableCaching"
    L4_1(L5_1)
    L4_1 = mp
    L4_1 = L4_1.get_mpattribute
    L5_1 = "Lua:ZipHasEncryptedFileWithExeExtension"
    L4_1 = L4_1(L5_1)
    if not L4_1 then
      L4_1 = mp
      L4_1 = L4_1.get_mpattribute
      L5_1 = "Lua:RarHasEncryptedFileWithExeExtension"
      L4_1 = L4_1(L5_1)
      if not L4_1 then
        goto lbl_139
      end
    end
    L4_1 = MpCommon
    L4_1 = L4_1.QueryPersistContext
    L5_1 = mp
    L5_1 = L5_1.getfilename
    L5_1 = L5_1()
    L6_1 = L0_1
    L4_1 = L4_1(L5_1, L6_1)
    if not L4_1 then
      L4_1 = MpCommon
      L4_1 = L4_1.AppendPersistContext
      L5_1 = mp
      L5_1 = L5_1.getfilename
      L5_1 = L5_1()
      L6_1 = L0_1
      L7_1 = 0
      L4_1(L5_1, L6_1, L7_1)
    end
    L4_1 = mp
    L4_1 = L4_1.SetHipsRule
    L5_1 = "be9ba2d9-53ea-4cdc-84e5-9b1eeee46550"
    L4_1(L5_1)
    L4_1 = mp
    L4_1 = L4_1.BLOCKACCESS
    do return L4_1 end
    ::lbl_139::
    L4_1 = MpCommon
    L4_1 = L4_1.AppendPersistContext
    L5_1 = mp
    L5_1 = L5_1.getfilename
    L5_1 = L5_1()
    L6_1 = "ContextualDropEncryptedArchiveByEmail"
    L7_1 = 300
    L4_1(L5_1, L6_1, L7_1)
    L4_1 = mp
    L4_1 = L4_1.getfilesize
    L4_1 = L4_1()
    if 10485760 < L4_1 then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L4_1 = mp
    L4_1 = L4_1.set_mpattribute
    L5_1 = "//Lua:ContextualDropExecutableFromWebmail.B"
    L4_1(L5_1)
    L4_1 = mp
    L4_1 = L4_1.set_mpattribute
    L5_1 = "MpForceScanArchives"
    L4_1(L5_1)
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
