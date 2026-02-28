local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.HEADERPAGE_SZ
if L0_1 < 32 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "Lua:LastFolder0!downloads"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = split
L1_1 = string
L1_1 = L1_1.lower
L2_1 = tostring
L3_1 = headerpage
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
L2_1 = L1_1
L1_1 = L1_1.sub
L3_1 = 21
L1_1 = L1_1(L2_1, L3_1)
L2_1 = "\r\n"
L0_1 = L0_1(L1_1, L2_1)
L1_1 = {}
L2_1 = ipairs
L3_1 = L0_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L8_1 = L6_1
  L7_1 = L6_1.sub
  L9_1 = 1
  L10_1 = 1
  L7_1 = L7_1(L8_1, L9_1, L10_1)
  L8_1 = L7_1
  L7_1 = L7_1.byte
  L7_1 = L7_1(L8_1)
  if 32 < L7_1 then
    L8_1 = L6_1
    L7_1 = L6_1.sub
    L9_1 = 1
    L10_1 = 1
    L7_1 = L7_1(L8_1, L9_1, L10_1)
    L8_1 = L7_1
    L7_1 = L7_1.byte
    L7_1 = L7_1(L8_1)
    if L7_1 < 126 then
      L7_1 = kvsplit
      L8_1 = L6_1
      L9_1 = "="
      L10_1 = L1_1
      L7_1(L8_1, L9_1, L10_1)
    end
  end
end
L2_1 = L1_1.url
if L2_1 ~= "" then
  L2_1 = L1_1.showcommand
  if L2_1 then
    L2_1 = L1_1.iconindex
    if L2_1 then
      L2_1 = L1_1.iconfile
      if L2_1 ~= "" then
        L2_1 = pcall
        L3_1 = mp
        L3_1 = L3_1.GetMOTWHostUrl
        L2_1, L3_1 = L2_1(L3_1)
        L4_1 = pcall
        L5_1 = mp
        L5_1 = L5_1.GetMOTWReferrerUrl
        L4_1, L5_1 = L4_1(L5_1)
        L6_1 = L3_1 or L6_1
        if not L3_1 then
          L6_1 = ""
        end
        L1_1.motwhosturl = L6_1
        L6_1 = L5_1 or L6_1
        if not L5_1 then
          L6_1 = ""
        end
        L1_1.motwreferrerurl = L6_1
        L6_1 = mp
        L6_1 = L6_1.set_mpattribute
        L7_1 = string
        L7_1 = L7_1.format
        L8_1 = "MpInternal_researchdata=CC_iShortcutData=%s"
        L9_1 = MpCommon
        L9_1 = L9_1.Base64Encode
        L10_1 = safeJsonSerialize
        L11_1 = L1_1
        L10_1, L11_1 = L10_1(L11_1)
        L9_1, L10_1, L11_1 = L9_1(L10_1, L11_1)
        L7_1, L8_1, L9_1, L10_1, L11_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
        L6_1(L7_1, L8_1, L9_1, L10_1, L11_1)
        L6_1 = mp
        L6_1 = L6_1.INFECTED
        return L6_1
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
