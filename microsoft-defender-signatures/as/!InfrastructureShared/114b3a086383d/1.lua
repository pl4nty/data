local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L9_1 = this_sigattrlog
L9_1 = L9_1[4]
L9_1 = L9_1.matched
if L9_1 then
  L9_1 = this_sigattrlog
  L9_1 = L9_1[4]
  L1_1 = L9_1.utf8p1
  L9_1 = string
  L9_1 = L9_1.match
  L10_1 = L1_1
  L11_1 = "\\([^\\]+)$"
  L9_1 = L9_1(L10_1, L11_1)
  L3_1 = L9_1
  L9_1 = this_sigattrlog
  L9_1 = L9_1[4]
  L0_1 = L9_1.ppid
else
  L9_1 = this_sigattrlog
  L9_1 = L9_1[5]
  L9_1 = L9_1.matched
  if L9_1 then
    L9_1 = this_sigattrlog
    L9_1 = L9_1[5]
    L2_1 = L9_1.utf8p1
    L9_1 = string
    L9_1 = L9_1.match
    L10_1 = L2_1
    L11_1 = "\\([^\\]+)$"
    L9_1 = L9_1(L10_1, L11_1)
    L4_1 = L9_1
    L9_1 = this_sigattrlog
    L9_1 = L9_1[5]
    L0_1 = L9_1.ppid
  else
    L9_1 = this_sigattrlog
    L9_1 = L9_1[6]
    L9_1 = L9_1.matched
    if L9_1 then
      L9_1 = this_sigattrlog
      L9_1 = L9_1[6]
      L5_1 = L9_1.utf8p1
    else
      L9_1 = this_sigattrlog
      L9_1 = L9_1[7]
      L9_1 = L9_1.matched
      if L9_1 then
        L9_1 = this_sigattrlog
        L9_1 = L9_1[7]
        L6_1 = L9_1.utf8p1
      else
        L9_1 = this_sigattrlog
        L9_1 = L9_1[8]
        L9_1 = L9_1.matched
        if L9_1 then
          L9_1 = this_sigattrlog
          L9_1 = L9_1[8]
          L7_1 = L9_1.utf8p1
        else
          L9_1 = this_sigattrlog
          L9_1 = L9_1[9]
          L9_1 = L9_1.matched
          if L9_1 then
            L9_1 = this_sigattrlog
            L9_1 = L9_1[9]
            L8_1 = L9_1.utf8p1
          end
        end
      end
    end
  end
end
if L1_1 == nil and L2_1 == nil or L5_1 == nil and L6_1 == nil or L7_1 == nil and L8_1 == nil or L3_1 == nil and L4_1 == nil or L0_1 == nil then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
if L3_1 == L5_1 or L3_1 == L6_1 or L4_1 == L5_1 or L4_1 == L6_1 then
  L9_1 = bm
  L9_1 = L9_1.request_SMS
  L10_1 = L0_1
  L11_1 = "h+"
  L9_1(L10_1, L11_1)
  L9_1 = TrackPidAndTechniqueBM
  L10_1 = "BM"
  L11_1 = "T1055.002"
  L12_1 = "portable_executable_injection"
  L9_1(L10_1, L11_1, L12_1)
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  return L9_1
end
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
