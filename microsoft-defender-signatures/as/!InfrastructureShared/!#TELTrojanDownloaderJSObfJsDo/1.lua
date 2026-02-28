local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = {}
L0_1["wscript.exe"] = true
L0_1["cscript.exe"] = true
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_PROCESSNAME
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
L2_1 = L0_1[L1_1]
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_PROCESS_PPID
L2_1 = L2_1(L3_1)
L3_1 = string
L3_1 = L3_1.lower
L4_1 = mp
L4_1 = L4_1.GetProcessCommandLine
L5_1 = L2_1
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L4_1(L5_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.getfilename
L5_1 = mp
L5_1 = L5_1.bitor
L6_1 = mp
L6_1 = L6_1.FILEPATH_QUERY_FULL
L7_1 = mp
L7_1 = L7_1.FILEPATH_QUERY_LOWERCASE
L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L5_1(L6_1, L7_1)
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
if not L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = "programdata\\{%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x}$"
L6_1 = string
L6_1 = L6_1.find
L7_1 = L4_1
L8_1 = L5_1
L6_1 = L6_1(L7_1, L8_1)
if not L6_1 then
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L3_1
  L8_1 = "--iserik"
  L6_1 = L6_1(L7_1, L8_1)
  if not L6_1 then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
end

function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = {}
  L2_2 = 1
  L3_2 = #A0_2
  L4_2 = 2
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = #L1_2
    L6_2 = L6_2 + 1
    L7_2 = string
    L7_2 = L7_2.char
    L8_2 = tonumber
    L10_2 = A0_2
    L9_2 = A0_2.sub
    L11_2 = L5_2
    L12_2 = L5_2 + 1
    L9_2 = L9_2(L10_2, L11_2, L12_2)
    L10_2 = 16
    L8_2, L9_2, L10_2, L11_2, L12_2 = L8_2(L9_2, L10_2)
    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
    L1_2[L6_2] = L7_2
  end
  L2_2 = table
  L2_2 = L2_2.concat
  L3_2 = L1_2
  L4_2 = ""
  return L2_2(L3_2, L4_2)
end

hexToAscii = L6_1
L6_1 = string
L6_1 = L6_1.gmatch
L7_1 = L3_1
L8_1 = "(%x%x%x%x[%x]+)"
L6_1, L7_1, L8_1 = L6_1(L7_1, L8_1)
for L9_1 in L6_1, L7_1, L8_1 do
  L11_1 = L9_1
  L10_1 = L9_1.find
  L12_1 = "^68747470"
  L10_1 = L10_1(L11_1, L12_1)
  if not L10_1 then
    L10_1 = string
    L10_1 = L10_1.lower
    L11_1 = hexToAscii
    L12_1 = L9_1
    L11_1, L12_1, L13_1 = L11_1(L12_1)
    L10_1 = L10_1(L11_1, L12_1, L13_1)
    L9_1 = L10_1
    if L9_1 then
      L10_1 = MpCommon
      L10_1 = L10_1.SetPersistContext
      L11_1 = L9_1
      L12_1 = {}
      L13_1 = "isErik"
      L12_1[1] = L13_1
      L13_1 = 0
      L10_1(L11_1, L12_1, L13_1)
    end
  end
end
L6_1 = mp
L6_1 = L6_1.INFECTED
return L6_1
