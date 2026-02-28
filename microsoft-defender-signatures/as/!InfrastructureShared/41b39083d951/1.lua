local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
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
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L1_1 = L1_1.utf8p2
    if L1_1 ~= nil then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[2]
      L0_1 = L1_1.utf8p2
    end
  end
end
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetExecutablesFromCommandLine
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L2_1 = ipairs
L3_1 = L1_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = StringEndsWith
  L8_1 = L6_1
  L9_1 = ".vbs"
  L7_1 = L7_1(L8_1, L9_1)
  if not L7_1 then
    L7_1 = StringEndsWith
    L8_1 = L6_1
    L9_1 = ".js"
    L7_1 = L7_1(L8_1, L9_1)
    if not L7_1 then
      goto lbl_90
    end
  end
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
    L7_1 = sysio
    L7_1 = L7_1.GetFileLastWriteTime
    L8_1 = L6_1
    L7_1 = L7_1(L8_1)
    L8_1 = sysio
    L8_1 = L8_1.GetLastResult
    L8_1 = L8_1()
    L8_1 = L8_1.Success
    if L8_1 and L7_1 ~= 0 then
      L8_1 = L7_1 / 10000000
      L7_1 = L8_1 - 11644473600
      L8_1 = MpCommon
      L8_1 = L8_1.GetCurrentTimeT
      L8_1 = L8_1()
      if L7_1 < L8_1 then
        L9_1 = L8_1 - L7_1
        if L9_1 <= 600 then
          L9_1 = bm
          L9_1 = L9_1.add_related_file
          L10_1 = L6_1
          L9_1(L10_1)
        end
      end
    end
  end
  ::lbl_90::
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
