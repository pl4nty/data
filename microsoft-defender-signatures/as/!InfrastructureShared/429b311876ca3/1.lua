local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = false
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[13]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[13]
  L1_1 = L2_1.utf8p2
  L0_1 = true
end
L2_1 = this_sigattrlog
L2_1 = L2_1[14]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[14]
  L1_1 = L2_1.utf8p2
  L2_1 = string
  L2_1 = L2_1.gmatch
  L3_1 = L1_1
  L4_1 = "RPort2_10=(%d+)-(%d+)|"
  L2_1, L3_1, L4_1 = L2_1(L3_1, L4_1)
  for L5_1, L6_1 in L2_1, L3_1, L4_1 do
    L7_1 = tonumber
    L8_1 = L5_1
    L7_1 = L7_1(L8_1)
    if L7_1 <= 443 then
      L7_1 = tonumber
      L8_1 = L6_1
      L7_1 = L7_1(L8_1)
      if 443 <= L7_1 then
        L0_1 = true
      end
    end
  end
end
L2_1 = "(app|svc|RA42|RA62|RA6|RA4|LA6|LA4|lport|LPort2_10|LPort2_20)="
L3_1 = MpCommon
L3_1 = L3_1.StringRegExpSearch
L4_1 = L2_1
L5_1 = L1_1
L3_1, L4_1 = L3_1(L4_1, L5_1)
if L0_1 and not L3_1 then
  L5_1 = pcall
  L6_1 = reportBmInfo
  L5_1, L6_1 = L5_1(L6_1)
  if not L5_1 and L6_1 then
    L7_1 = bm
    L7_1 = L7_1.add_related_string
    L8_1 = "bmInfoFailReason"
    L9_1 = tostring
    L10_1 = L6_1
    L9_1 = L9_1(L10_1)
    L10_1 = bm
    L10_1 = L10_1.RelatedStringBMReport
    L7_1(L8_1, L9_1, L10_1)
  end
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
