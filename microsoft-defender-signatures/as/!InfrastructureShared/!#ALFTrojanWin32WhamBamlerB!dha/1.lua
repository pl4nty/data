local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = false
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if 15000000 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.getfilename
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FULL
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L3_1(L4_1, L5_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
L3_1 = mp
L3_1 = L3_1.get_mpattribute
L4_1 = "Lua:FileInsideSystemFolder"
L3_1 = L3_1(L4_1)
if L3_1 then
  L4_1 = L2_1
  L3_1 = L2_1.find
  L5_1 = "\\system32\\wbem\\wbemcore.tlb"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if not L3_1 then
    L4_1 = L2_1
    L3_1 = L2_1.find
    L5_1 = "\\system32\\wbem\\wbemnet.dll"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if not L3_1 then
      L4_1 = L2_1
      L3_1 = L2_1.find
      L5_1 = "\\system32\\xwtpw.dll"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if not L3_1 then
        L4_1 = L2_1
        L3_1 = L2_1.find
        L5_1 = "\\system32\\wbem\\suyl.dll"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if not L3_1 then
          L4_1 = L2_1
          L3_1 = L2_1.find
          L5_1 = "\\system32\\wbem\\suyl.tlb"
          L6_1 = 1
          L7_1 = true
          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
          if not L3_1 then
            L4_1 = L2_1
            L3_1 = L2_1.find
            L5_1 = "\\system32\\explorerf.dll"
            L6_1 = 1
            L7_1 = true
            L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
            if not L3_1 then
              L4_1 = L2_1
              L3_1 = L2_1.find
              L5_1 = "\\system32\\wpdsh.dll"
              L6_1 = 1
              L7_1 = true
              L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
              if not L3_1 then
                L4_1 = L2_1
                L3_1 = L2_1.find
                L5_1 = "\\system32\\wbem\\sppext.tlb"
                L6_1 = 1
                L7_1 = true
                L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                if not L3_1 then
                  L4_1 = L2_1
                  L3_1 = L2_1.find
                  L5_1 = "\\system32\\wbem\\mstscax.tlb"
                  L6_1 = 1
                  L7_1 = true
                  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                end
              end
            end
          end
        end
      end
    end
  end
  if L3_1 then
    L0_1 = true
  end
else
  L3_1 = mp
  L3_1 = L3_1.get_mpattribute
  L4_1 = "Lua:FileInsideProgramDataFolder"
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L4_1 = L2_1
    L3_1 = L2_1.find
    L5_1 = "programdata\\microsoft\\windows\\spasetup32.uce"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if not L3_1 then
      L4_1 = L2_1
      L3_1 = L2_1.find
      L5_1 = "programdata\\microsoft\\windows\\spasetup64.uce"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if not L3_1 then
        L4_1 = L2_1
        L3_1 = L2_1.find
        L5_1 = "programdata\\microsoft\\windows\\spasetup.uce"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if not L3_1 then
          L4_1 = L2_1
          L3_1 = L2_1.find
          L5_1 = "programdata\\microsoft\\windows\\caches\\comobj.uce"
          L6_1 = 1
          L7_1 = true
          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
          if not L3_1 then
            goto lbl_126
          end
        end
      end
    end
    L0_1 = true
  end
end
::lbl_126::
if L0_1 then
  L3_1 = sysio
  L3_1 = L3_1.RegOpenKey
  L4_1 = "HKLM\\SOFTWARE\\Microsoft\\Cryptography"
  L3_1 = L3_1(L4_1)
  if L3_1 ~= nil then
    L4_1 = sysio
    L4_1 = L4_1.GetRegValueAsString
    L5_1 = L3_1
    L6_1 = "MachineGuid"
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 ~= nil then
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = string
      L6_1 = L6_1.format
      L7_1 = "MpInternal_researchdata=CryptoMachineGuid=%s"
      L8_1 = L4_1
      L6_1, L7_1, L8_1 = L6_1(L7_1, L8_1)
      L5_1(L6_1, L7_1, L8_1)
    end
  end
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "MpNonPIIFileType"
  L4_1(L5_1)
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
