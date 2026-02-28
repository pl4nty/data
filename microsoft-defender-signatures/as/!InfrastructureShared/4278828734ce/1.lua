local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L0_1 = hstrlog
L0_1 = L0_1[1]
if L0_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.matched
  if L0_1 then
    goto lbl_19
  end
end
L0_1 = hstrlog
L0_1 = L0_1[2]
if L0_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.matched
  ::lbl_19::
  if L0_1 then
    L0_1 = peattributes
    L0_1 = L0_1.isdll
    if L0_1 then
      L0_1 = peattributes
      L0_1 = L0_1.x86_image
      if L0_1 then
        L0_1 = pesecs
        L1_1 = pehdr
        L1_1 = L1_1.NumberOfSections
        L0_1 = L0_1[L1_1]
        L0_1 = L0_1.Name
        if L0_1 == ".reloc" then
          L0_1 = mp
          L0_1 = L0_1.readprotection
          L1_1 = false
          L0_1(L1_1)
          L0_1 = nil
          L1_1 = hstrlog
          L1_1 = L1_1[1]
          L1_1 = L1_1.matched
          if L1_1 then
            L1_1 = mp
            L1_1 = L1_1.readfile
            L2_1 = pe
            L2_1 = L2_1.foffset_va
            L3_1 = hstrlog
            L3_1 = L3_1[1]
            L3_1 = L3_1.VA
            L2_1 = L2_1(L3_1)
            L2_1 = L2_1 + 12
            L3_1 = 4
            L1_1 = L1_1(L2_1, L3_1)
            L0_1 = L1_1
          else
            L1_1 = hstrlog
            L1_1 = L1_1[2]
            L1_1 = L1_1.matched
            if L1_1 then
              L1_1 = mp
              L1_1 = L1_1.readfile
              L2_1 = pe
              L2_1 = L2_1.foffset_va
              L3_1 = hstrlog
              L3_1 = L3_1[2]
              L3_1 = L3_1.VA
              L2_1 = L2_1(L3_1)
              L2_1 = L2_1 + 12
              L3_1 = 4
              L1_1 = L1_1(L2_1, L3_1)
              L0_1 = L1_1
            end
          end
          if L0_1 ~= nil then
            L1_1 = mp
            L1_1 = L1_1.readu_u32
            L2_1 = L0_1
            L3_1 = 1
            L1_1 = L1_1(L2_1, L3_1)
            if L1_1 ~= nil then
              L2_1 = mp
              L2_1 = L2_1.readfile
              L3_1 = pe
              L3_1 = L3_1.foffset_va
              L4_1 = L1_1
              L3_1 = L3_1(L4_1)
              L4_1 = 80
              L2_1 = L2_1(L3_1, L4_1)
              if L2_1 ~= nil then
                L3_1 = #L2_1
                if L3_1 == 80 then
                  L3_1 = "k\000e\000r\000n\000e\000l\003\002\000.\000d\000l\000l\000"
                  L4_1 = 0
                  L5_1 = 0
                  L6_1 = 0
                  L7_1 = 0
                  L8_1 = 15
                  L9_1 = 1
                  for L10_1 = L7_1, L8_1, L9_1 do
                    L11_1 = mp
                    L11_1 = L11_1.readu_u32
                    L12_1 = L2_1
                    L13_1 = L10_1 * 4
                    L13_1 = L13_1 + 1
                    L11_1 = L11_1(L12_1, L13_1)
                    L12_1 = pe
                    L12_1 = L12_1.foffset_va
                    L13_1 = L11_1
                    L12_1 = L12_1(L13_1)
                    if L12_1 ~= nil and L12_1 ~= 4294967295 then
                      L13_1 = mp
                      L13_1 = L13_1.readfile
                      L14_1 = L12_1
                      L15_1 = 20
                      L13_1 = L13_1(L14_1, L15_1)
                      L14_1 = #L13_1
                      if L14_1 == 20 then
                        L14_1 = tostring
                        L15_1 = L13_1
                        L14_1 = L14_1(L15_1)
                        L16_1 = L14_1
                        L15_1 = L14_1.match
                        L17_1 = "[ -~]+"
                        L15_1 = L15_1(L16_1, L17_1)
                        if L15_1 ~= "" then
                          L17_1 = L15_1
                          L16_1 = L15_1.match
                          L18_1 = "^[%w]+%.[%a][%a][%a]?[%a]?$"
                          L16_1 = L16_1(L17_1, L18_1)
                          if L16_1 then
                            L17_1 = L15_1
                            L16_1 = L15_1.match
                            L18_1 = "%.log$"
                            L16_1 = L16_1(L17_1, L18_1)
                            if not L16_1 then
                              L17_1 = L15_1
                              L16_1 = L15_1.match
                              L18_1 = "%.dll$"
                              L16_1 = L16_1(L17_1, L18_1)
                              if not L16_1 then
                                L17_1 = L15_1
                                L16_1 = L15_1.match
                                L18_1 = "%.exe$"
                                L16_1 = L16_1(L17_1, L18_1)
                                if not L16_1 then
                                  L16_1 = mp
                                  L16_1 = L16_1.readprotection
                                  L17_1 = true
                                  L16_1(L17_1)
                                  L16_1 = mp
                                  L16_1 = L16_1.INFECTED
                                  return L16_1
                              end
                            end
                          end
                        end
                        else
                          if L15_1 ~= "kernel32.dll" then
                            if L15_1 ~= "k" then
                              goto lbl_174
                            end
                            L17_1 = L14_1
                            L16_1 = L14_1.sub
                            L18_1 = 1
                            L19_1 = #L3_1
                            L16_1 = L16_1(L17_1, L18_1, L19_1)
                            if L16_1 ~= L3_1 then
                              goto lbl_174
                            end
                          end
                          L4_1 = 1
                          goto lbl_184
                          ::lbl_174::
                          if L15_1 == "ExitProcess" then
                            L5_1 = 1
                          else
                            L17_1 = L14_1
                            L16_1 = L14_1.match
                            L18_1 = "%.\000e\000x\000e\000"
                            L16_1 = L16_1(L17_1, L18_1)
                            if L16_1 then
                              L6_1 = 1
                            end
                          end
                        end
                      end
                    end
                    ::lbl_184::
                  end
                  if L4_1 == 1 and L5_1 == 1 and L6_1 == 1 then
                    L7_1 = mp
                    L7_1 = L7_1.readprotection
                    L8_1 = true
                    L7_1(L8_1)
                    L7_1 = mp
                    L7_1 = L7_1.INFECTED
                    return L7_1
                  end
                end
              end
            end
          end
          L1_1 = mp
          L1_1 = L1_1.readprotection
          L2_1 = true
          L1_1(L2_1)
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
