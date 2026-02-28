local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = 30000000
L1_1 = bm
L1_1 = L1_1.GetSignatureMatchDuration
L1_1 = L1_1()
if L0_1 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = nil
L3_1 = this_sigattrlog
L3_1 = L3_1[6]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[6]
  L3_1 = L3_1.wp2
  if L3_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = this_sigattrlog
    L4_1 = L4_1[6]
    L4_1 = L4_1.utf8p2
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
end
else
  L3_1 = this_sigattrlog
  L3_1 = L3_1[7]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[7]
    L3_1 = L3_1.wp2
    if L3_1 ~= nil then
      L3_1 = string
      L3_1 = L3_1.lower
      L4_1 = this_sigattrlog
      L4_1 = L4_1[7]
      L4_1 = L4_1.utf8p2
      L3_1 = L3_1(L4_1)
      L2_1 = L3_1
  end
  else
    L3_1 = this_sigattrlog
    L3_1 = L3_1[8]
    L3_1 = L3_1.matched
    if L3_1 then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[8]
      L3_1 = L3_1.wp2
      if L3_1 ~= nil then
        L3_1 = string
        L3_1 = L3_1.lower
        L4_1 = this_sigattrlog
        L4_1 = L4_1[8]
        L4_1 = L4_1.utf8p2
        L3_1 = L3_1(L4_1)
        L2_1 = L3_1
      end
    end
  end
end
if L2_1 ~= nil then
  L3_1 = mp
  L3_1 = L3_1.GetExecutablesFromCommandLine
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  L4_1 = ipairs
  L5_1 = L3_1
  L4_1, L5_1, L6_1 = L4_1(L5_1)
  for L7_1, L8_1 in L4_1, L5_1, L6_1 do
    L9_1 = mp
    L9_1 = L9_1.ContextualExpandEnvironmentVariables
    L10_1 = L8_1
    L9_1 = L9_1(L10_1)
    L8_1 = L9_1
    L9_1 = sysio
    L9_1 = L9_1.IsFileExists
    L10_1 = L8_1
    L9_1 = L9_1(L10_1)
    if L9_1 then
      L9_1 = mp
      L9_1 = L9_1.CLEAN
      return L9_1
    end
  end
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L2_1
  L6_1 = ".py"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L2_1
    L6_1 = ".pl"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if not L4_1 then
      L4_1 = string
      L4_1 = L4_1.find
      L5_1 = L2_1
      L6_1 = ".rb"
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if not L4_1 then
        goto lbl_120
      end
    end
  end
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
::lbl_120::
L3_1 = reportRelatedBmHits
L3_1()
L3_1 = addRelatedProcess
L3_1()
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
