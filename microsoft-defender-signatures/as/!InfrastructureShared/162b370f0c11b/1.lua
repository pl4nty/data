local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L2_1 = this_sigattrlog
L2_1 = L2_1[4]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[4]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[4]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= nil then
      L2_1 = string
      L2_1 = L2_1.lower
      L3_1 = this_sigattrlog
      L3_1 = L3_1[4]
      L3_1 = L3_1.utf8p1
      L2_1 = L2_1(L3_1)
      L4_1 = L2_1
      L3_1 = L2_1.match
      L5_1 = "software\\classes\\%.([^\\]+)"
      L3_1 = L3_1(L4_1, L5_1)
      L1_1 = L3_1
      L3_1 = string
      L3_1 = L3_1.lower
      L4_1 = this_sigattrlog
      L4_1 = L4_1[4]
      L4_1 = L4_1.utf8p2
      L3_1 = L3_1(L4_1)
      L0_1 = L3_1
    end
  end
end
if L1_1 ~= nil then
  L2_1 = #L1_1
  if not (L2_1 < 4) then
    goto lbl_41
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_41::
if L0_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = nil
L3_1 = this_sigattrlog
L3_1 = L3_1[3]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[3]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = this_sigattrlog
    L4_1 = L4_1[3]
    L4_1 = L4_1.utf8p1
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
  end
end
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = nil
L4_1 = nil
L5_1 = nil
L6_1 = this_sigattrlog
L6_1 = L6_1[5]
L6_1 = L6_1.matched
if L6_1 then
  L6_1 = this_sigattrlog
  L6_1 = L6_1[5]
  L6_1 = L6_1.utf8p1
  if L6_1 ~= nil then
    L6_1 = this_sigattrlog
    L6_1 = L6_1[5]
    L6_1 = L6_1.utf8p2
    if L6_1 ~= nil then
      L6_1 = string
      L6_1 = L6_1.lower
      L7_1 = this_sigattrlog
      L7_1 = L7_1[5]
      L7_1 = L7_1.utf8p1
      L6_1 = L6_1(L7_1)
      L3_1 = L6_1
      L6_1 = this_sigattrlog
      L6_1 = L6_1[5]
      L4_1 = L6_1.utf8p2
      L7_1 = L4_1
      L6_1 = L4_1.gmatch
      L8_1 = "%.[gG][eE][tT][sS][tT][rR][iI][nN][gG].+[Ff][Rr][Oo][Mm][Bb][Aa][Ss][Ee]64[Ss][Tt][Rr][Ii][Nn][Gg]%s*%(%s*['\"]?(.-)['\"]?%s*%)"
      L6_1, L7_1, L8_1 = L6_1(L7_1, L8_1)
      for L9_1 in L6_1, L7_1, L8_1 do
        if L9_1 then
          L10_1 = string
          L10_1 = L10_1.gsub
          L11_1 = L9_1
          L12_1 = " "
          L13_1 = ""
          L10_1 = L10_1(L11_1, L12_1, L13_1)
          L9_1 = L10_1
          L10_1 = string
          L10_1 = L10_1.gsub
          L11_1 = L9_1
          L12_1 = "['\"]%+['\"]"
          L13_1 = ""
          L10_1 = L10_1(L11_1, L12_1, L13_1)
          L9_1 = L10_1
          L10_1 = MpCommon
          L10_1 = L10_1.Base64Decode
          L11_1 = L9_1
          L10_1 = L10_1(L11_1)
          if L10_1 ~= nil and L10_1 ~= "" then
            L12_1 = L10_1
            L11_1 = L10_1.match
            L13_1 = "\\([^\\]+)$"
            L11_1 = L11_1(L12_1, L13_1)
            L5_1 = L11_1
          end
        end
      end
    end
  end
end
if L5_1 == nil then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
else
  L6_1 = string
  L6_1 = L6_1.lower
  L7_1 = L5_1
  L6_1 = L6_1(L7_1)
  L5_1 = L6_1
end
L6_1 = nil
L7_1 = this_sigattrlog
L7_1 = L7_1[2]
L7_1 = L7_1.matched
if L7_1 then
  L7_1 = this_sigattrlog
  L7_1 = L7_1[2]
  L7_1 = L7_1.utf8p1
  if L7_1 ~= nil then
    L7_1 = this_sigattrlog
    L7_1 = L7_1[2]
    L6_1 = L7_1.utf8p1
  end
end
L8_1 = L2_1
L7_1 = L2_1.find
L9_1 = L5_1
L10_1 = 1
L11_1 = true
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
if not L7_1 then
  L8_1 = L2_1
  L7_1 = L2_1.find
  L9_1 = L1_1
  L10_1 = 1
  L11_1 = true
  L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
  if not L7_1 then
    L8_1 = L3_1
    L7_1 = L3_1.find
    L9_1 = L0_1
    L10_1 = 1
    L11_1 = true
    L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
    if not L7_1 then
      goto lbl_200
    end
  end
end
if L6_1 ~= nil then
  L7_1 = sysio
  L7_1 = L7_1.IsFileExists
  L8_1 = L6_1
  L7_1 = L7_1(L8_1)
  if L7_1 then
    L7_1 = bm
    L7_1 = L7_1.add_threat_file
    L8_1 = L6_1
    L7_1(L8_1)
  end
end
L7_1 = sysio
L7_1 = L7_1.IsFileExists
L8_1 = L2_1
L7_1 = L7_1(L8_1)
if L7_1 then
  L7_1 = bm
  L7_1 = L7_1.add_threat_file
  L8_1 = L6_1
  L7_1(L8_1)
end
L7_1 = mp
L7_1 = L7_1.INFECTED
do return L7_1 end
::lbl_200::
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
