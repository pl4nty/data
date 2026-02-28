local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
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
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_FILENAME
L1_1 = L1_1(L2_1)
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = string
L3_1 = L3_1.match
L4_1 = L1_1
L5_1 = "(%.[^%.]+)$"
L3_1, L4_1, L5_1, L6_1 = L3_1(L4_1, L5_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
L3_1 = string
L3_1 = L3_1.lower
L4_1 = mp
L4_1 = L4_1.get_contextdata
L5_1 = mp
L5_1 = L5_1.CONTEXT_DATA_PROCESSNAME
L4_1, L5_1, L6_1 = L4_1(L5_1)
L3_1 = L3_1(L4_1, L5_1, L6_1)
if L3_1 == nil or L3_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
if L3_1 == "powershell.exe" then
  if L2_1 ~= ".ps1" then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
else
  if L3_1 ~= "cscript.exe" and L3_1 ~= "wscript.exe" then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  if L2_1 ~= ".js" and L2_1 ~= ".vbs" then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
end
L4_1 = mp
L4_1 = L4_1.get_mpattribute
L5_1 = "ObfuscatedScriptA"
L4_1 = L4_1(L5_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.ReportLowfi
  L5_1 = mp
  L5_1 = L5_1.getfilename
  L5_1 = L5_1()
  L6_1 = 2889548347
  L4_1(L5_1, L6_1)
else
  L4_1 = mp
  L4_1 = L4_1.get_mpattribute
  L5_1 = "ObfuscatedScriptB"
  L4_1 = L4_1(L5_1)
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.ReportLowfi
    L5_1 = mp
    L5_1 = L5_1.getfilename
    L5_1 = L5_1()
    L6_1 = 892490625
    L4_1(L5_1, L6_1)
  else
    L4_1 = mp
    L4_1 = L4_1.get_mpattribute
    L5_1 = "ObfuscatedScriptC"
    L4_1 = L4_1(L5_1)
    if L4_1 then
      L4_1 = mp
      L4_1 = L4_1.ReportLowfi
      L5_1 = mp
      L5_1 = L5_1.getfilename
      L5_1 = L5_1()
      L6_1 = 1110795031
      L4_1(L5_1, L6_1)
    else
      L4_1 = mp
      L4_1 = L4_1.get_mpattribute
      L5_1 = "ObfuscatedScriptD"
      L4_1 = L4_1(L5_1)
      if L4_1 then
        L4_1 = mp
        L4_1 = L4_1.ReportLowfi
        L5_1 = mp
        L5_1 = L5_1.getfilename
        L5_1 = L5_1()
        L6_1 = 3696359092
        L4_1(L5_1, L6_1)
      else
        L4_1 = mp
        L4_1 = L4_1.CLEAN
        return L4_1
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.set_mpattribute
L5_1 = "MpDisableCaching"
L4_1(L5_1)
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
