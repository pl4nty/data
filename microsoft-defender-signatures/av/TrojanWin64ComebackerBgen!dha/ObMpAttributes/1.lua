local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = pe
L0_1 = L0_1.get_exports
L0_1, L1_1 = L0_1()
if 3 < L0_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = {}
L2_1.DllMain = 10
L2_1.ASN2_TYPE_new = 1
L2_1.ASN2_TYPE_newW = 1
L2_1.CleanupBrokerString = 1
L2_1.cmsSetLogHandlerTHR = 1
L2_1.deflateSuffix = 1
L2_1.ENGINE_get_RAND = 1
L2_1.ENGINE_get_RANDW = 1
L2_1.glInitSampler = 1
L2_1.json_object_get_unicode_string = 1
L2_1.ntSystemInfo = 1
L2_1.ntWindowsProc = 1
L2_1.SetWebFilterString = 1
L2_1.sql_blob_open = 1
L2_1.SSL_HandShaking = 1
L3_1 = 0
L4_1 = 1
L5_1 = L0_1
L6_1 = 1
for L7_1 = L4_1, L5_1, L6_1 do
  L8_1 = pe
  L8_1 = L8_1.mmap_string_rva
  L9_1 = L1_1[L7_1]
  L9_1 = L9_1.namerva
  L10_1 = 64
  L8_1 = L8_1(L9_1, L10_1)
  L9_1 = L2_1[L8_1]
  if L9_1 ~= nil then
    L9_1 = L2_1[L8_1]
    L3_1 = L3_1 + L9_1
  end
end
if L3_1 == 10 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
elseif 11 <= L3_1 then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
elseif 0 < L3_1 then
  L4_1 = {}
  L4_1[".bin"] = true
  L4_1[".cpl"] = true
  L4_1[".dat"] = true
  L4_1[".db"] = true
  L5_1 = mp
  L5_1 = L5_1.getfilename
  L6_1 = mp
  L6_1 = L6_1.bitor
  L7_1 = mp
  L7_1 = L7_1.FILEPATH_QUERY_FNAME
  L8_1 = mp
  L8_1 = L8_1.FILEPATH_QUERY_LOWERCASE
  L6_1, L7_1, L8_1, L9_1, L10_1 = L6_1(L7_1, L8_1)
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1)
  L7_1 = L5_1
  L6_1 = L5_1.sub
  L8_1 = -3
  L6_1 = L6_1(L7_1, L8_1)
  L6_1 = L4_1[L6_1]
  if L6_1 == nil then
    L7_1 = L5_1
    L6_1 = L5_1.sub
    L8_1 = -4
    L6_1 = L6_1(L7_1, L8_1)
    L6_1 = L4_1[L6_1]
    if L6_1 == nil then
      goto lbl_86
    end
  end
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
::lbl_86::
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
