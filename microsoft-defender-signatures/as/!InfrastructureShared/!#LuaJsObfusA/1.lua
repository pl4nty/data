local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1, L4_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1)
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.sub
  L2_1 = L0_1
  L3_1 = -3
  L1_1 = L1_1(L2_1, L3_1)
  L2_1 = string
  L2_1 = L2_1.sub
  L3_1 = L0_1
  L4_1 = -4
  L2_1 = L2_1(L3_1, L4_1)
  if L1_1 == ".js" or L2_1 == ".jse" or L2_1 == ".vbs" or L2_1 == ".vbe" or L2_1 == ".wsf" then
    L3_1 = mp
    L3_1 = L3_1.get_mpattributesubstring
    L4_1 = "JS/Obfus"
    L3_1 = L3_1(L4_1)
    if not L3_1 then
      L3_1 = mp
      L3_1 = L3_1.get_mpattributesubstring
      L4_1 = "SCPT:Jenxcus"
      L3_1 = L3_1(L4_1)
      if not L3_1 then
        L3_1 = mp
        L3_1 = L3_1.get_mpattributesubstring
        L4_1 = "VBS/Obfus"
        L3_1 = L3_1(L4_1)
        if not L3_1 then
          L3_1 = mp
          L3_1 = L3_1.get_mpattributesubstring
          L4_1 = "SCPT:Kira"
          L3_1 = L3_1(L4_1)
          if not L3_1 then
            L3_1 = mp
            L3_1 = L3_1.get_mpattributesubstring
            L4_1 = "SCPT:Obfusc"
            L3_1 = L3_1(L4_1)
            if not L3_1 then
              L3_1 = mp
              L3_1 = L3_1.get_mpattributesubstring
              L4_1 = "SCPT:SimpleAsciiObfuscator"
              L3_1 = L3_1(L4_1)
              if not L3_1 then
                L3_1 = mp
                L3_1 = L3_1.get_mpattributesubstring
                L4_1 = "JS/Obfuscator"
                L3_1 = L3_1(L4_1)
                if not L3_1 then
                  L3_1 = mp
                  L3_1 = L3_1.get_mpattributesubstring
                  L4_1 = "SWF/Obfuscator"
                  L3_1 = L3_1(L4_1)
                  if not L3_1 then
                    L3_1 = mp
                    L3_1 = L3_1.get_mpattributesubstring
                    L4_1 = "SCPT:charcode.A"
                    L3_1 = L3_1(L4_1)
                    if not L3_1 then
                      L3_1 = mp
                      L3_1 = L3_1.get_mpattributesubstring
                      L4_1 = "ObfusHead"
                      L3_1 = L3_1(L4_1)
                      if not L3_1 then
                        L3_1 = mp
                        L3_1 = L3_1.get_mpattributesubstring
                        L4_1 = "SCRIPT:StringFromCharCode.A"
                        L3_1 = L3_1(L4_1)
                        if not L3_1 then
                          L3_1 = mp
                          L3_1 = L3_1.get_mpattributesubstring
                          L4_1 = "VBS/Obfuscator"
                          L3_1 = L3_1(L4_1)
                          if not L3_1 then
                            goto lbl_104
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
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
::lbl_104::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
