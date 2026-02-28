local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L0_1 = L1_1.utf8p2
  end
end
if L0_1 ~= nil then
  L1_1 = mp
  L1_1 = L1_1.GetExecutablesFromCommandLine
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  L2_1 = ipairs
  L3_1 = L1_1
  L2_1, L3_1, L4_1 = L2_1(L3_1)
  for L5_1, L6_1 in L2_1, L3_1, L4_1 do
    L7_1 = mp
    L7_1 = L7_1.ContextualExpandEnvironmentVariables
    L8_1 = L6_1
    L7_1 = L7_1(L8_1)
    L6_1 = L7_1
    L7_1 = sysio
    L7_1 = L7_1.IsFileExists
    L8_1 = L6_1
    L7_1 = L7_1(L8_1)
    if L7_1 then
      L7_1 = bm
      L7_1 = L7_1.add_related_file
      L8_1 = L6_1
      L7_1(L8_1)
      L7_1 = string
      L7_1 = L7_1.find
      L8_1 = string
      L8_1 = L8_1.lower
      L9_1 = L6_1
      L8_1 = L8_1(L9_1)
      L9_1 = ".mp3"
      L10_1 = 1
      L11_1 = true
      L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
      if L7_1 == nil then
        L7_1 = string
        L7_1 = L7_1.find
        L8_1 = string
        L8_1 = L8_1.lower
        L9_1 = L6_1
        L8_1 = L8_1(L9_1)
        L9_1 = ".mp4"
        L10_1 = 1
        L11_1 = true
        L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
        if L7_1 == nil then
          L7_1 = string
          L7_1 = L7_1.find
          L8_1 = string
          L8_1 = L8_1.lower
          L9_1 = L6_1
          L8_1 = L8_1(L9_1)
          L9_1 = ".mov"
          L10_1 = 1
          L11_1 = true
          L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
          if L7_1 == nil then
            L7_1 = string
            L7_1 = L7_1.find
            L8_1 = string
            L8_1 = L8_1.lower
            L9_1 = L6_1
            L8_1 = L8_1(L9_1)
            L9_1 = ".m4a"
            L10_1 = 1
            L11_1 = true
            L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
            if L7_1 == nil then
              goto lbl_91
            end
          end
        end
      end
      L7_1 = bm
      L7_1 = L7_1.add_threat_file
      L8_1 = L6_1
      L7_1(L8_1)
    end
    ::lbl_91::
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
