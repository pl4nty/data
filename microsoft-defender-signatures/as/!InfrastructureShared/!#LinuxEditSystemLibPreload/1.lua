local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L1_1 = L1_1(L2_1)
if L1_1 ~= "/etc/ld.so.preload" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = tostring
L3_1 = headerpage
L2_1 = L2_1(L3_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = ipairs
L4_1 = split
L5_1 = L2_1
L6_1 = "\n"
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L4_1(L5_1, L6_1)
L3_1, L4_1, L5_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  if L7_1 ~= nil and L7_1 ~= "" then
    L8_1 = sysio
    L8_1 = L8_1.IsFileExists
    L9_1 = L7_1
    L8_1 = L8_1(L9_1)
    if L8_1 then
      L8_1 = mp
      L8_1 = L8_1.ReportLowfi
      L9_1 = L7_1
      L10_1 = 4017216192
      L8_1(L9_1, L10_1)
    end
  end
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
