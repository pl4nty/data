local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 4096 or 5242880 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = peattributes
L1_1 = L1_1.packersigmatched
if L1_1 == true then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = peattributes
L1_1 = L1_1.dropped
if L1_1 == true then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
if L1_1 < 3 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = pehdr
L1_1 = L1_1.Subsystem
if L1_1 ~= 2 then
  L1_1 = pehdr
  L1_1 = L1_1.Subsystem
  if L1_1 ~= 3 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "MpInternalParanoid"
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "HSTR:VirTool:Win32/CeeInject.gen!KK_enc"
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = mp
    L3_1 = L3_1.getfilename
    L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L3_1()
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
    L3_1 = ".pse$"
    L1_1 = L1_1(L2_1, L3_1)
    if not L1_1 then
      L1_1 = mp
      L1_1 = L1_1.get_mpattribute
      L2_1 = "VirTool:Win32/CeeInject.gen!KK_enc"
      L1_1 = L1_1(L2_1)
      if not L1_1 then
        L1_1 = mp
        L1_1 = L1_1.get_mpattribute
        L2_1 = "Zbot:CeeInject.gen!KK_enc"
        L1_1 = L1_1(L2_1)
        if not L1_1 then
          L1_1 = mp
          L1_1 = L1_1.CLEAN
          return L1_1
        end
      end
      L1_1 = 0
      L2_1 = peattributes
      L2_1 = L2_1.suspicious_dosheader
      if L2_1 then
        L1_1 = L1_1 + 1
      end
      L2_1 = peattributes
      L2_1 = L2_1.suspicious_falign
      if L2_1 then
        L1_1 = L1_1 + 1
      end
      L2_1 = peattributes
      L2_1 = L2_1.suspicious_heap_geometry
      if L2_1 then
        L1_1 = L1_1 + 1
      end
      L2_1 = peattributes
      L2_1 = L2_1.suspicious_heap_size
      if L2_1 then
        L1_1 = L1_1 + 1
      end
      L2_1 = peattributes
      L2_1 = L2_1.suspicious_image_size
      if L2_1 then
        L1_1 = L1_1 + 1
      end
      L2_1 = peattributes
      L2_1 = L2_1.suspicious_image_version
      if L2_1 then
        L1_1 = L1_1 + 1
      end
      L2_1 = peattributes
      L2_1 = L2_1.suspicious_imagebase
      if L2_1 then
        L1_1 = L1_1 + 1
      end
      L2_1 = peattributes
      L2_1 = L2_1.suspicious_linker_version
      if L2_1 then
        L1_1 = L1_1 + 1
      end
      L2_1 = peattributes
      L2_1 = L2_1.suspicious_ntheader
      if L2_1 then
        L1_1 = L1_1 + 1
      end
      L2_1 = peattributes
      L2_1 = L2_1.suspicious_number_of_dirs
      if L2_1 then
        L1_1 = L1_1 + 1
      end
      L2_1 = peattributes
      L2_1 = L2_1.suspicious_os_version
      if L2_1 then
        L1_1 = L1_1 + 1
      end
      L2_1 = peattributes
      L2_1 = L2_1.suspicious_rebase
      if L2_1 then
        L1_1 = L1_1 + 1
      end
      L2_1 = peattributes
      L2_1 = L2_1.suspicious_section_characteristics
      if L2_1 then
        L1_1 = L1_1 + 1
      end
      L2_1 = peattributes
      L2_1 = L2_1.suspicious_section_fsize
      if L2_1 then
        L1_1 = L1_1 + 1
      end
      L2_1 = peattributes
      L2_1 = L2_1.suspicious_section_name
      if L2_1 then
        L1_1 = L1_1 + 1
      end
      L2_1 = peattributes
      L2_1 = L2_1.suspicious_section_offset
      if L2_1 then
        L1_1 = L1_1 + 1
      end
      L2_1 = peattributes
      L2_1 = L2_1.suspicious_section_rva
      if L2_1 then
        L1_1 = L1_1 + 1
      end
      L2_1 = peattributes
      L2_1 = L2_1.suspicious_section_vsize
      if L2_1 then
        L1_1 = L1_1 + 1
      end
      L2_1 = peattributes
      L2_1 = L2_1.suspicious_stack_geometry
      if L2_1 then
        L1_1 = L1_1 + 1
      end
      L2_1 = peattributes
      L2_1 = L2_1.suspicious_stack_size
      if L2_1 then
        L1_1 = L1_1 + 1
      end
      L2_1 = peattributes
      L2_1 = L2_1.suspicious_subsystem
      if L2_1 then
        L1_1 = L1_1 + 1
      end
      L2_1 = peattributes
      L2_1 = L2_1.suspicious_subsystem_version
      if L2_1 then
        L1_1 = L1_1 + 1
      end
      L2_1 = peattributes
      L2_1 = L2_1.suspicious_timestamp
      if L2_1 then
        L1_1 = L1_1 + 1
      end
      L2_1 = peattributes
      L2_1 = L2_1.suspicious_valign
      if L2_1 then
        L1_1 = L1_1 + 1
      end
      if L1_1 < 3 then
        L2_1 = pesecs
        L2_1 = L2_1[1]
        L2_1 = L2_1.NameDW
        if L2_1 ~= 2019914798 then
          L2_1 = pesecs
          L2_1 = L2_1[1]
          L2_1 = L2_1.NameDW
          if L2_1 ~= 2019915566 then
            L2_1 = pesecs
            L2_1 = L2_1[1]
            L2_1 = L2_1.NameDW
            if L2_1 ~= 2019914896 then
              L2_1 = pesecs
              L2_1 = L2_1[1]
              L2_1 = L2_1.NameDW
              if L2_1 ~= 2019914753 then
                L2_1 = pesecs
                L2_1 = L2_1[1]
                L2_1 = L2_1.NameDW
                if L2_1 ~= 2019914795 then
                  L2_1 = pesecs
                  L2_1 = L2_1[1]
                  L2_1 = L2_1.NameDW
                  if L2_1 ~= 2013361198 then
                    L2_1 = pesecs
                    L2_1 = L2_1[1]
                    L2_1 = L2_1.NameDW
                    if L2_1 ~= 2019885358 then
                      L2_1 = pesecs
                      L2_1 = L2_1[1]
                      L2_1 = L2_1.NameDW
                      if L2_1 ~= 23426094 then
                        L2_1 = pesecs
                        L2_1 = L2_1[1]
                        L2_1 = L2_1.Characteristics
                        if L2_1 ~= 1610612768 then
                          L2_1 = pesecs
                          L2_1 = L2_1[1]
                          L2_1 = L2_1.Characteristics
                          if L2_1 ~= 3758096416 then
                            L2_1 = pesecs
                            L2_1 = L2_1[1]
                            L2_1 = L2_1.Characteristics
                            if L2_1 ~= 1610612737 then
                              L2_1 = pesecs
                              L2_1 = L2_1[1]
                              L2_1 = L2_1.Characteristics
                              if L2_1 ~= 1610612880 then
                                L2_1 = pesecs
                                L2_1 = L2_1[1]
                                L2_1 = L2_1.Characteristics
                                if L2_1 ~= 1610743840 then
                                  L2_1 = pesecs
                                  L2_1 = L2_1[1]
                                  L2_1 = L2_1.Characteristics
                                  if L2_1 ~= 1342177312 then
                                    L2_1 = pesecs
                                    L2_1 = L2_1[1]
                                    L2_1 = L2_1.Characteristics
                                    if L2_1 ~= 1610612739 then
                                      L2_1 = pesecs
                                      L2_1 = L2_1[1]
                                      L2_1 = L2_1.Characteristics
                                      if L2_1 ~= 2415919136 then
                                        L2_1 = pesecs
                                        L2_1 = L2_1[1]
                                        L2_1 = L2_1.Characteristics
                                        if L2_1 ~= 1879048224 then
                                          L2_1 = pesecs
                                          L2_1 = L2_1[1]
                                          L2_1 = L2_1.Characteristics
                                          if L2_1 ~= 1879085088 then
                                            L2_1 = pesecs
                                            L2_1 = L2_1[1]
                                            L2_1 = L2_1.Characteristics
                                            if L2_1 ~= 1879048240 then
                                              L2_1 = pesecs
                                              L2_1 = L2_1[1]
                                              L2_1 = L2_1.Characteristics
                                              if L2_1 ~= 1879048480 then
                                                L2_1 = pesecs
                                                L2_1 = L2_1[1]
                                                L2_1 = L2_1.Characteristics
                                                if L2_1 ~= 1610612741 then
                                                  L2_1 = pesecs
                                                  L2_1 = L2_1[1]
                                                  L2_1 = L2_1.Characteristics
                                                  if L2_1 ~= 1610618400 then
                                                    L2_1 = pesecs
                                                    L2_1 = L2_1[1]
                                                    L2_1 = L2_1.Characteristics
                                                    if L2_1 ~= 1610612896 then
                                                      L2_1 = pesecs
                                                      L2_1 = L2_1[1]
                                                      L2_1 = L2_1.Characteristics
                                                      if L2_1 ~= 1073741888 then
                                                        L2_1 = pesecs
                                                        L2_1 = L2_1[1]
                                                        L2_1 = L2_1.Characteristics
                                                        if L2_1 ~= 1342177344 then
                                                          L2_1 = pesecs
                                                          L2_1 = L2_1[1]
                                                          L2_1 = L2_1.Characteristics
                                                          if L2_1 ~= 3841982496 then
                                                            L2_1 = pesecs
                                                            L2_1 = L2_1[1]
                                                            L2_1 = L2_1.Characteristics
                                                            if L2_1 ~= 1073741856 then
                                                              L2_1 = pesecs
                                                              L2_1 = L2_1[1]
                                                              L2_1 = L2_1.Characteristics
                                                              if L2_1 ~= 1610612800 then
                                                                L2_1 = mp
                                                                L2_1 = L2_1.CLEAN
                                                                return L2_1
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
        L2_1 = pesecs
        L2_1 = L2_1[2]
        L2_1 = L2_1.NameDW
        if L2_1 ~= 1633972782 then
          L2_1 = pesecs
          L2_1 = L2_1[2]
          L2_1 = L2_1.NameDW
          if L2_1 ~= 1633972737 then
            L2_1 = pesecs
            L2_1 = L2_1[2]
            L2_1 = L2_1.NameDW
            if L2_1 ~= 1414677294 then
              L2_1 = pesecs
              L2_1 = L2_1[2]
              L2_1 = L2_1.NameDW
              if L2_1 ~= 1633970478 then
                L2_1 = pesecs
                L2_1 = L2_1[2]
                L2_1 = L2_1.NameDW
                if L2_1 ~= 1920168494 then
                  L2_1 = pesecs
                  L2_1 = L2_1[2]
                  L2_1 = L2_1.NameDW
                  if L2_1 ~= 1627419182 then
                    L2_1 = pesecs
                    L2_1 = L2_1[2]
                    L2_1 = L2_1.NameDW
                    if L2_1 ~= 1633972737 then
                      L2_1 = pesecs
                      L2_1 = L2_1[2]
                      L2_1 = L2_1.NameDW
                      if L2_1 ~= 1633972739 then
                        L2_1 = pesecs
                        L2_1 = L2_1[2]
                        L2_1 = L2_1.Characteristics
                        if L2_1 ~= 1073741888 then
                          L2_1 = pesecs
                          L2_1 = L2_1[2]
                          L2_1 = L2_1.Characteristics
                          if L2_1 ~= 16777280 then
                            L2_1 = pesecs
                            L2_1 = L2_1[2]
                            L2_1 = L2_1.Characteristics
                            if L2_1 ~= 3221225536 then
                              L2_1 = pesecs
                              L2_1 = L2_1[2]
                              L2_1 = L2_1.Characteristics
                              if L2_1 ~= 3221291072 then
                                L2_1 = pesecs
                                L2_1 = L2_1[2]
                                L2_1 = L2_1.Characteristics
                                if L2_1 ~= 3758096416 then
                                  L2_1 = pesecs
                                  L2_1 = L2_1[2]
                                  L2_1 = L2_1.Characteristics
                                  if L2_1 ~= 1073741827 then
                                    L2_1 = pesecs
                                    L2_1 = L2_1[2]
                                    L2_1 = L2_1.Characteristics
                                    if L2_1 ~= 1073807424 then
                                      L2_1 = pesecs
                                      L2_1 = L2_1[2]
                                      L2_1 = L2_1.Characteristics
                                      if L2_1 ~= 1073741825 then
                                        L2_1 = pesecs
                                        L2_1 = L2_1[2]
                                        L2_1 = L2_1.Characteristics
                                        if L2_1 ~= 2868904000 then
                                          L2_1 = pesecs
                                          L2_1 = L2_1[2]
                                          L2_1 = L2_1.Characteristics
                                          if L2_1 ~= 2868904256 then
                                            L2_1 = pesecs
                                            L2_1 = L2_1[2]
                                            L2_1 = L2_1.Characteristics
                                            if L2_1 ~= 3221225473 then
                                              L2_1 = pesecs
                                              L2_1 = L2_1[2]
                                              L2_1 = L2_1.Characteristics
                                              if L2_1 ~= 2868904193 then
                                                L2_1 = pesecs
                                                L2_1 = L2_1[2]
                                                L2_1 = L2_1.Characteristics
                                                if L2_1 ~= 1073773120 then
                                                  L2_1 = pesecs
                                                  L2_1 = L2_1[2]
                                                  L2_1 = L2_1.Characteristics
                                                  if L2_1 ~= 1442840640 then
                                                    L2_1 = pesecs
                                                    L2_1 = L2_1[2]
                                                    L2_1 = L2_1.Characteristics
                                                    if L2_1 ~= 1073742144 then
                                                      L2_1 = pesecs
                                                      L2_1 = L2_1[2]
                                                      L2_1 = L2_1.Characteristics
                                                      if L2_1 ~= 1442881600 then
                                                        L2_1 = pesecs
                                                        L2_1 = L2_1[2]
                                                        L2_1 = L2_1.Characteristics
                                                        if L2_1 ~= 1073807424 then
                                                          L2_1 = pesecs
                                                          L2_1 = L2_1[2]
                                                          L2_1 = L2_1.Characteristics
                                                          if L2_1 ~= 2147483712 then
                                                            L2_1 = pesecs
                                                            L2_1 = L2_1[2]
                                                            L2_1 = L2_1.Characteristics
                                                            if L2_1 ~= 3489660992 then
                                                              L2_1 = pesecs
                                                              L2_1 = L2_1[2]
                                                              L2_1 = L2_1.Characteristics
                                                              if L2_1 ~= 1610612768 then
                                                                L2_1 = mp
                                                                L2_1 = L2_1.CLEAN
                                                                return L2_1
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
  end
end
L1_1 = mp
L1_1 = L1_1.readprotection
L2_1 = false
L1_1(L2_1)
L1_1 = "MZ\144\000\003\000\000\000\004\000\000\000\255\255\000\000\184\000\000\000\000\000\000\000@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\192\000\000\000\014\031\186\014\000\180\t\205!\184\001L\205![DYNEXE] A HELPER STUB TO EMULATE WIN32 MALWARES.$-----------------------------------------------------------jirehPE\000\000L\001\001\000\000\000\000\000\000\000\000\000\000\000\000\000\224\000\002\001\v\001\n\n\004\000\000\000\000\000\000\000\000\000\000\000\224\001\000\000\224\001\000\000\228\001\000\000\000\000@\000\001\000\000\000\001\000\000\000\005\000\001\000\000\000\000\000\005\000\001\000\000\000\000\000\224\001P\000\224\001\000\000\000\000\000\000\003\000@\133\000\000\016\000\000\016\000\000\000\000\016\000\000\016\000\000\000\000\000\000\016\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000.xray\000\000\000\000\000P\000\224\001\000\000\000\000P\000\224\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\224\000\000\224\195"
L2_1 = pesecs
L2_1 = L2_1[1]
L2_1 = L2_1.PointerToRawData
if L0_1 <= L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = pesecs
L2_1 = L2_1[1]
L2_1 = L2_1.PointerToRawData
L2_1 = L0_1 - L2_1
if 5242880 < L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L1_1
L3_1 = mp
L3_1 = L3_1.readfile
L4_1 = pesecs
L4_1 = L4_1[1]
L4_1 = L4_1.PointerToRawData
L5_1 = pesecs
L5_1 = L5_1[1]
L5_1 = L5_1.PointerToRawData
L5_1 = L0_1 - L5_1
L3_1 = L3_1(L4_1, L5_1)
L2_1 = L2_1 .. L3_1
L3_1 = peattributes
L3_1 = L3_1.packed
if L3_1 == true then
  L3_1 = mp
  L3_1 = L3_1.get_parent_filehandle
  L3_1 = L3_1()
  if L3_1 == nil then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = mp
  L4_1 = L4_1.get_filesize_by_handle
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  if 5242880 < L4_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = L2_1
  L6_1 = mp
  L6_1 = L6_1.readfile_by_handle
  L7_1 = L3_1
  L8_1 = 0
  L9_1 = L4_1
  L6_1 = L6_1(L7_1, L8_1, L9_1)
  L2_1 = L5_1 .. L6_1
end
L3_1 = #L2_1
if not (L3_1 < 4096) then
  L3_1 = #L2_1
  if not (5242880 < L3_1) then
    goto lbl_563
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_563::
L3_1 = L2_1
L4_1 = fastBinaryTransform
L5_1 = L2_1
L6_1 = "(.)."
L7_1 = 0
L8_1 = mp
L8_1 = L8_1.bitxor
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
L2_1 = L3_1 .. L4_1
L3_1 = L2_1
L4_1 = fastBinaryTransform
L5_1 = L2_1
L6_1 = ".(.)"
L7_1 = 0
L8_1 = mp
L8_1 = L8_1.bitxor
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
L2_1 = L3_1 .. L4_1
L3_1 = #L2_1
if not (L3_1 < 4096) then
  L3_1 = #L2_1
  if not (5242880 < L3_1) then
    goto lbl_590
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_590::
L3_1 = mp
L3_1 = L3_1.vfo_add_buffer
L4_1 = L2_1
L5_1 = "[CeeInject_KK_DynExe]"
L6_1 = mp
L6_1 = L6_1.ADD_VFO_TAKE_ACTION_ON_DAD
L3_1(L4_1, L5_1, L6_1)
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
