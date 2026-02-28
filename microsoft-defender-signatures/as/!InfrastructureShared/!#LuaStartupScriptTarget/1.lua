local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FNAME
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 <= 3) then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "."
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if L1_1 ~= nil then
      goto lbl_28
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_28::
L1_1 = {}
L1_1.bat = 372652227
L1_1.cmd = 372652227
L1_1.pif = 2403297657
L1_1.vbe = 4164442607
L1_1.vbs = 4164442607
L1_1[".js"] = 1717357644
L1_1.jse = 1717357644
L1_1.wsh = 291241178
L1_1.wsf = 291241178
L1_1.ps1 = 2287119712
L1_1.hta = 4283801078
L2_1 = string
L2_1 = L2_1.sub
L3_1 = L0_1
L4_1 = -3
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= nil then
  L3_1 = #L2_1
  if not (L3_1 <= 2) then
    L3_1 = L1_1[L2_1]
    if L3_1 ~= nil then
      goto lbl_56
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_56::
L3_1 = L1_1[L2_1]
L4_1 = mp
L4_1 = L4_1.get_contextdata
L5_1 = mp
L5_1 = L5_1.CONTEXT_DATA_SCANREASON
L4_1 = L4_1(L5_1)
L5_1 = mp
L5_1 = L5_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L4_1 == L5_1 then
  L5_1 = string
  L5_1 = L5_1.lower
  L6_1 = tostring
  L7_1 = headerpage
  L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L6_1(L7_1)
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
  L6_1 = mp
  L6_1 = L6_1.GetExecutablesFromCommandLine
  L7_1 = L5_1
  L6_1 = L6_1(L7_1)
  L7_1 = ipairs
  L8_1 = L6_1
  L7_1, L8_1, L9_1 = L7_1(L8_1)
  for L10_1, L11_1 in L7_1, L8_1, L9_1 do
    L12_1 = mp
    L12_1 = L12_1.ContextualExpandEnvironmentVariables
    L13_1 = L11_1
    L12_1 = L12_1(L13_1)
    L11_1 = L12_1
    L12_1 = sysio
    L12_1 = L12_1.IsFileExists
    L13_1 = L11_1
    L12_1 = L12_1(L13_1)
    if L12_1 then
      L12_1 = mp
      L12_1 = L12_1.ReportLowfi
      L13_1 = L11_1
      L14_1 = L3_1
      L12_1(L13_1, L14_1)
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
