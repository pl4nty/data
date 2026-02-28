local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.enum_mpattributesubstring
L1_1 = "SLF:Backdoor:MSIL/SuspSQLAssembly."
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if L1_1 ~= 0 then
    goto lbl_13
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_13::
L1_1 = mp
L1_1 = L1_1.enum_mpattributesubstring
L2_1 = "Lua:PeOriginalName!"
L1_1 = L1_1(L2_1)
if L1_1 ~= nil then
  L2_1 = #L1_1
  if L2_1 ~= 0 then
    goto lbl_25
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_25::
L2_1 = string
L2_1 = L2_1.lower
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_PROCESSNAME
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1 = L3_1(L4_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
if L2_1 == "sqlservr.exe" then
  L3_1 = mp
  L3_1 = L3_1.get_contextdata
  L4_1 = mp
  L4_1 = L4_1.CONTEXT_DATA_PROCESS_PPID
  L3_1 = L3_1(L4_1)
  if L3_1 ~= nil then
    L4_1 = ipairs
    L5_1 = L1_1
    L4_1, L5_1, L6_1 = L4_1(L5_1)
    for L7_1, L8_1 in L4_1, L5_1, L6_1 do
      L9_1 = TT_SendBMSigTrigger
      L10_1 = L3_1
      L11_1 = "SuspSQLModuleName"
      L12_1 = L8_1
      L9_1(L10_1, L11_1, L12_1)
    end
  end
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
