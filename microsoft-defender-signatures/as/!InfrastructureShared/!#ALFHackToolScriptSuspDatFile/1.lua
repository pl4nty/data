local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
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
L1_1 = {}
L1_1["avidfosnp.dat"] = ""
L1_1["fntcache.dat"] = ""
L1_1["version.dat"] = ""
L1_1["prfh0804.dat"] = ""
L1_1["prfc0804.dat"] = ""
L1_1["prfc0416.dat"] = ""
L1_1["cloudconfiguration.dat"] = ""
L1_1["vxautocollimatorrand.dat"] = ""
L1_1["klick.dat"] = ""
L1_1["kiln.dat"] = ""
L1_1["lfont.dat"] = ""
L1_1["mfont.dat"] = ""
L1_1["prfh0416.dat"] = ""
L1_1["eppicprinterdb.dat"] = ""
L1_1["e4661b94-e45f-42c5-a278-9f3b41ff5522.dat"] = ""
L1_1["srudb.dat"] = ""
L1_1["usbcir.dat"] = ""
L2_1 = mp
L2_1 = L2_1.getfilename
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FNAME
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1 = L3_1(L4_1, L5_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
L3_1 = L1_1[L2_1]
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.getfilename
L4_1 = mp
L4_1 = L4_1.bitor
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_FULL
L6_1 = mp
L6_1 = L6_1.FILEPATH_QUERY_LOWERCASE
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1 = L4_1(L5_1, L6_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
L4_1 = MpCommon
L4_1 = L4_1.PathToWin32Path
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
L5_1 = L3_1
L4_1 = L3_1.find
L6_1 = "\\windows\\system32\\spool\\drivers\\x64\\3\\"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if not L4_1 then
  L5_1 = L3_1
  L4_1 = L3_1.find
  L6_1 = "\\driverstore\\filerepository\\"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 then
    L5_1 = L3_1
    L4_1 = L3_1.find
    L6_1 = ".inf"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if L4_1 then
      goto lbl_185
    end
  end
  L5_1 = L3_1
  L4_1 = L3_1.find
  L6_1 = "\\windows\\system32\\ativv"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    L5_1 = L3_1
    L4_1 = L3_1.find
    L6_1 = "\\windows\\system32\\drivers\\dsark.dat"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if not L4_1 then
      L5_1 = L3_1
      L4_1 = L3_1.find
      L6_1 = "\\windows\\system32\\lc.dat"
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if not L4_1 then
        L5_1 = L3_1
        L4_1 = L3_1.find
        L6_1 = "\\windows\\system32\\drivers\\mtkwl"
        L7_1 = 1
        L8_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
        if not L4_1 then
          L5_1 = L3_1
          L4_1 = L3_1.find
          L6_1 = "\\windows\\system32\\perfc"
          L7_1 = 1
          L8_1 = true
          L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
          if not L4_1 then
            L5_1 = L3_1
            L4_1 = L3_1.find
            L6_1 = "\\windows\\system32\\perfh"
            L7_1 = 1
            L8_1 = true
            L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
            if not L4_1 then
              L5_1 = L3_1
              L4_1 = L3_1.find
              L6_1 = "\\windows\\system32\\driverstore\\temp\\"
              L7_1 = 1
              L8_1 = true
              L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
              if not L4_1 then
                L5_1 = L3_1
                L4_1 = L3_1.find
                L6_1 = "\\windows\\system32\\spool\\drivers\\arm64\\3\\"
                L7_1 = 1
                L8_1 = true
                L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                if not L4_1 then
                  L5_1 = L3_1
                  L4_1 = L3_1.find
                  L6_1 = "zdesigner"
                  L7_1 = 1
                  L8_1 = true
                  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                  if not L4_1 then
                    L5_1 = L3_1
                    L4_1 = L3_1.find
                    L6_1 = "\\windows\\system32\\spool\\{"
                    L7_1 = 1
                    L8_1 = true
                    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                    if not L4_1 then
                      L5_1 = L3_1
                      L4_1 = L3_1.find
                      L6_1 = "antiphishing"
                      L7_1 = 1
                      L8_1 = true
                      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                      if not L4_1 then
                        L5_1 = L3_1
                        L4_1 = L3_1.find
                        L6_1 = "eppicpattern"
                        L7_1 = 1
                        L8_1 = true
                        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                        if not L4_1 then
                          L5_1 = L3_1
                          L4_1 = L3_1.find
                          L6_1 = "system32\\config\\systemprofile"
                          L7_1 = 1
                          L8_1 = true
                          L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                          if not L4_1 then
                            L5_1 = L3_1
                            L4_1 = L3_1.find
                            L6_1 = "system32\\windowspowershell\\v1.0\\modules\\dbatools"
                            L7_1 = 1
                            L8_1 = true
                            L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                            if not L4_1 then
                              goto lbl_188
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
::lbl_185::
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_188::
L4_1 = mp
L4_1 = L4_1.readheader
L5_1 = 0
L6_1 = 257
L4_1 = L4_1(L5_1, L6_1)
L5_1 = 0
L6_1 = 0
L7_1 = 0
L8_1 = 0
L9_1 = 1
L10_1 = 256
L11_1 = 1
for L12_1 = L9_1, L10_1, L11_1 do
  L13_1 = string
  L13_1 = L13_1.byte
  L14_1 = L4_1
  L15_1 = L12_1
  L13_1 = L13_1(L14_1, L15_1)
  L7_1 = L13_1
  L13_1 = string
  L13_1 = L13_1.byte
  L14_1 = L4_1
  L15_1 = L12_1 + 1
  L13_1 = L13_1(L14_1, L15_1)
  L8_1 = L13_1
  if L7_1 == 0 then
    if L8_1 == 0 then
      L13_1 = mp
      L13_1 = L13_1.CLEAN
      return L13_1
    end
    L5_1 = L5_1 + 1
  end
  if 4 < L5_1 then
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  end
  if 32 <= L7_1 and L7_1 <= 127 or 9 <= L7_1 and L7_1 <= 13 then
    L6_1 = L6_1 + 1
  end
  if 180 < L6_1 then
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  end
end
L9_1 = mp
L9_1 = L9_1.INFECTED
return L9_1
