local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1
L1_1 = ""
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= nil then
      L2_1 = this_sigattrlog
      L0_1 = L2_1[1]
  end
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.utf8p1
    if L2_1 ~= nil then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[2]
      L2_1 = L2_1.utf8p2
      if L2_1 ~= nil then
        L2_1 = this_sigattrlog
        L0_1 = L2_1[2]
    end
  end
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[3]
      L2_1 = L2_1.utf8p1
      if L2_1 ~= nil then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[3]
        L2_1 = L2_1.utf8p2
        if L2_1 ~= nil then
          L2_1 = this_sigattrlog
          L0_1 = L2_1[3]
      end
    end
    else
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
            L2_1 = this_sigattrlog
            L0_1 = L2_1[4]
        end
      end
      else
        L2_1 = this_sigattrlog
        L2_1 = L2_1[5]
        L2_1 = L2_1.matched
        if L2_1 then
          L2_1 = this_sigattrlog
          L2_1 = L2_1[5]
          L2_1 = L2_1.utf8p1
          if L2_1 ~= nil then
            L2_1 = this_sigattrlog
            L2_1 = L2_1[5]
            L2_1 = L2_1.utf8p2
            if L2_1 ~= nil then
              L2_1 = this_sigattrlog
              L0_1 = L2_1[5]
            end
          end
        end
      end
    end
  end
end
if not L0_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = "DataExfilCreatedFile"
L3_1 = 1
L4_1 = mp
L4_1 = L4_1.SIGATTR_LOG_SZ
L5_1 = 1
for L6_1 = L3_1, L4_1, L5_1 do
  L7_1 = sigattr_head
  L7_1 = L7_1[L6_1]
  L7_1 = L7_1.matched
  if L7_1 then
    L7_1 = sigattr_head
    L7_1 = L7_1[L6_1]
    L7_1 = L7_1.attribute
    if L7_1 == 16384 then
      L7_1 = sigattr_head
      L7_1 = L7_1[L6_1]
      L7_1 = L7_1.utf8p1
      if L7_1 then
        L7_1 = string
        L7_1 = L7_1.lower
        L8_1 = sigattr_head
        L8_1 = L8_1[L6_1]
        L8_1 = L8_1.utf8p1
        L7_1 = L7_1(L8_1)
        L1_1 = L7_1
        L7_1 = string
        L7_1 = L7_1.match
        L8_1 = L1_1
        L9_1 = "(%.[^%.]+)$"
        L7_1 = L7_1(L8_1, L9_1)
        L8_1 = contains
        L9_1 = L7_1
        L10_1 = {}
        L11_1 = ".zip"
        L12_1 = ".7z"
        L13_1 = ".rar"
        L14_1 = ".z"
        L15_1 = ".arj"
        L16_1 = ".tar"
        L17_1 = ".gz"
        L18_1 = ".tar.gz"
        L19_1 = ".s7z"
        L20_1 = ".ace"
        L21_1 = ".rk"
        L22_1 = ".gz"
        L23_1 = ".lz"
        L24_1 = ".zipx"
        L25_1 = ".bz2"
        L10_1[1] = L11_1
        L10_1[2] = L12_1
        L10_1[3] = L13_1
        L10_1[4] = L14_1
        L10_1[5] = L15_1
        L10_1[6] = L16_1
        L10_1[7] = L17_1
        L10_1[8] = L18_1
        L10_1[9] = L19_1
        L10_1[10] = L20_1
        L10_1[11] = L21_1
        L10_1[12] = L22_1
        L10_1[13] = L23_1
        L10_1[14] = L24_1
        L10_1[15] = L25_1
        L8_1 = L8_1(L9_1, L10_1)
        if L8_1 then
          L8_1 = AppendToRollingQueue
          L9_1 = "DataComTrack"
          L10_1 = L2_1
          L11_1 = L1_1
          L8_1(L9_1, L10_1, L11_1)
          L8_1 = mp
          L8_1 = L8_1.INFECTED
          return L8_1
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
