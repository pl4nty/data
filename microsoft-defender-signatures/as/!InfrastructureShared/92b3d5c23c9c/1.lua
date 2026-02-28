local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
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
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = {}
L1_1[".js"] = true
L2_1 = bm_AddRelatedFileFromCommandLine
L3_1 = L0_1
L4_1 = L1_1
L5_1 = nil
L6_1 = 1
L2_1(L3_1, L4_1, L5_1, L6_1)
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
      L2_1 = L2_1[1]
      L2_1 = L2_1.utf8p1
      L3_1 = string
      L3_1 = L3_1.match
      L4_1 = L2_1
      L5_1 = "<Arguments>(.*)</Arguments>"
      L3_1 = L3_1(L4_1, L5_1)
      L4_1 = string
      L4_1 = L4_1.match
      L5_1 = L2_1
      L6_1 = "<WorkingDirectory>(.*)</WorkingDirectory>"
      L4_1 = L4_1(L5_1, L6_1)
      if L3_1 ~= nil then
        L6_1 = L3_1
        L5_1 = L3_1.find
        L7_1 = ":\\"
        L8_1 = 1
        L9_1 = true
        L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
        if L5_1 then
          L5_1 = bm_AddRelatedFileFromCommandLine
          L6_1 = L3_1
          L7_1 = L1_1
          L8_1 = nil
          L9_1 = 1
          L5_1(L6_1, L7_1, L8_1, L9_1)
        elseif L4_1 ~= nil then
          L5_1 = bm_AddRelatedFileFromCommandLine
          L6_1 = L4_1
          L7_1 = "\\"
          L8_1 = L3_1
          L6_1 = L6_1 .. L7_1 .. L8_1
          L7_1 = L1_1
          L8_1 = nil
          L9_1 = 1
          L5_1(L6_1, L7_1, L8_1, L9_1)
        end
      end
      L5_1 = mp
      L5_1 = L5_1.INFECTED
      return L5_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
