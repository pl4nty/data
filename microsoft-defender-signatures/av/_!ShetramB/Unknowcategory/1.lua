local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 ~= L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = string
L2_1 = L2_1.sub
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_FILENAME
L3_1 = L3_1(L4_1)
L4_1 = -9
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
if L1_1 ~= " copy.lnk" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = {}
L1_1["cpufix.exe"] = true
L1_1["antiusb.exe"] = true
L1_1["streamer.exe"] = true
L1_1["radnewage.exe"] = true
L1_1["cpuchecker.exe"] = true
L1_1["winddowsupdater.exe"] = true
L2_1 = string
L2_1 = L2_1.lower
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_PROCESSNAME
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L3_1(L4_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
L3_1 = {}
L4_1 = 0
L5_1 = mp
L5_1 = L5_1.getfilename
L5_1 = L5_1()
L6_1 = string
L6_1 = L6_1.gmatch
L7_1 = L5_1
L8_1 = "[^\\]+"
L6_1, L7_1, L8_1 = L6_1(L7_1, L8_1)
for L9_1 in L6_1, L7_1, L8_1 do
  L4_1 = L4_1 + 1
  L3_1[L4_1] = L9_1
end
L6_1 = #L3_1
if 2 <= L6_1 then
  L6_1 = string
  L6_1 = L6_1.len
  L7_1 = #L3_1
  L7_1 = L3_1[L7_1]
  L6_1 = L6_1(L7_1)
  L7_1 = string
  L7_1 = L7_1.len
  L8_1 = #L3_1
  L8_1 = L8_1 - 1
  L8_1 = L3_1[L8_1]
  L7_1 = L7_1(L8_1)
  L7_1 = L7_1 + 9
  if L6_1 == L7_1 then
    L6_1 = string
    L6_1 = L6_1.sub
    L7_1 = #L3_1
    L7_1 = L3_1[L7_1]
    L8_1 = 1
    L9_1 = string
    L9_1 = L9_1.len
    L10_1 = #L3_1
    L10_1 = L10_1 - 1
    L10_1 = L3_1[L10_1]
    L9_1, L10_1, L11_1 = L9_1(L10_1)
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1)
    L7_1 = #L3_1
    L7_1 = L7_1 - 1
    L7_1 = L3_1[L7_1]
    if L6_1 == L7_1 then
      L6_1 = L1_1[L2_1]
      if L6_1 == true then
        L6_1 = mp
        L6_1 = L6_1.INFECTED
        return L6_1
      else
        L6_1 = mp
        L6_1 = L6_1.ReportLowfi
        L7_1 = L5_1
        L8_1 = 2621711671
        L6_1(L7_1, L8_1)
      end
    end
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
