local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L0_1 = L1_1.utf8p2
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[3]
      L0_1 = L1_1.utf8p2
  end
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[4]
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[4]
      L1_1 = L1_1.matched
      if L1_1 then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[4]
        L0_1 = L1_1.utf8p2
    end
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[5]
      if L1_1 then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[5]
        L1_1 = L1_1.matched
        if L1_1 then
          L1_1 = this_sigattrlog
          L1_1 = L1_1[5]
          L0_1 = L1_1.utf8p2
        end
      end
    end
  end
end
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 < 62) then
    goto lbl_60
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_60::
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = contains
L2_1 = L0_1
L3_1 = {}
L4_1 = "whoami.exe"
L5_1 = "base64"
L6_1 = "net user"
L7_1 = "net localgroup"
L8_1 = "systeminfo"
L9_1 = "hostname"
L10_1 = "ipconfig"
L11_1 = "getmac"
L12_1 = "netstat"
L13_1 = "nslookup"
L14_1 = "ping"
L15_1 = "tracert"
L16_1 = "wmic process"
L17_1 = "schtasks /query"
L18_1 = "-urlcache -split"
L19_1 = "wevtutil"
L20_1 = "attrib"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L3_1[6] = L9_1
L3_1[7] = L10_1
L3_1[8] = L11_1
L3_1[9] = L12_1
L3_1[10] = L13_1
L3_1[11] = L14_1
L3_1[12] = L15_1
L3_1[13] = L16_1
L3_1[14] = L17_1
L3_1[15] = L18_1
L3_1[16] = L19_1
L3_1[17] = L20_1
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = bm
  L1_1 = L1_1.add_related_string
  L2_1 = "W3WPCommand"
  L3_1 = tostring
  L4_1 = L0_1
  L3_1 = L3_1(L4_1)
  L4_1 = bm
  L4_1 = L4_1.RelatedStringBMReport
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
