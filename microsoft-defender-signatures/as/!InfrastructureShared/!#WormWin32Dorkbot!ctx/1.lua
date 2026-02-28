local L0_1, L1_1
L0_1 = pehdr
L0_1 = L0_1.Machine
if L0_1 ~= 332 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 8192 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "Detection:Trojan:Win32/Bagsu!rfn"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "Detection:Trojan:Win32/Bulta!rfn"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.get_mpattribute
    L1_1 = "Detection:VirTool:Win32/Obfuscator.AMM"
    L0_1 = L0_1(L1_1)
    if not L0_1 then
      L0_1 = mp
      L0_1 = L0_1.get_mpattribute
      L1_1 = "Detection:Trojan:Win32/Toga!rfn"
      L0_1 = L0_1(L1_1)
      if not L0_1 then
        L0_1 = mp
        L0_1 = L0_1.get_mpattribute
        L1_1 = "RDTSC_Anti"
        L0_1 = L0_1(L1_1)
        if not L0_1 then
          L0_1 = mp
          L0_1 = L0_1.get_mpattribute
          L1_1 = "HSTR:CheckSavedErrorCode"
          L0_1 = L0_1(L1_1)
          if not L0_1 then
            L0_1 = mp
            L0_1 = L0_1.get_mpattribute
            L1_1 = "HSTR:Trojan:Win32/Lznt_Xor8_Win32"
            L0_1 = L0_1(L1_1)
            if not L0_1 then
              L0_1 = mp
              L0_1 = L0_1.get_mpattribute
              L1_1 = "MpHasExpensiveLoop"
              L0_1 = L0_1(L1_1)
              if not L0_1 then
                L0_1 = mp
                L0_1 = L0_1.get_mpattribute
                L1_1 = "Lua:SuspiciousSectionName"
                L0_1 = L0_1(L1_1)
                if not L0_1 then
                  L0_1 = mp
                  L0_1 = L0_1.get_mpattributesubstring
                  L1_1 = "attrmatch_codepatch_"
                  L0_1 = L0_1(L1_1)
                  if not L0_1 then
                    L0_1 = mp
                    L0_1 = L0_1.get_mpattributesubstring
                    L1_1 = "PEBMPAT:AutoSig"
                    L0_1 = L0_1(L1_1)
                    if not L0_1 then
                      L0_1 = mp
                      L0_1 = L0_1.get_mpattributesubstring
                      L1_1 = "PEEMU:AutoSig"
                      L0_1 = L0_1(L1_1)
                      if not L0_1 then
                        L0_1 = mp
                        L0_1 = L0_1.get_mpattributesubstring
                        L1_1 = "HSTR:AutoSig"
                        L0_1 = L0_1(L1_1)
                        if not L0_1 then
                          L0_1 = mp
                          L0_1 = L0_1.get_mpattribute
                          L1_1 = "SIGATTR:VirTool:Win32/Obfuscator.AKE"
                          L0_1 = L0_1(L1_1)
                          if not L0_1 then
                            L0_1 = mp
                            L0_1 = L0_1.get_mpattribute
                            L1_1 = "HSTR:Win32/Obfuscator.NGR"
                            L0_1 = L0_1(L1_1)
                            if not L0_1 then
                              L0_1 = mp
                              L0_1 = L0_1.get_mpattribute
                              L1_1 = "HSTR:Win32/Obfuscator.NGR2"
                              L0_1 = L0_1(L1_1)
                              if not L0_1 then
                                L0_1 = mp
                                L0_1 = L0_1.get_mpattribute
                                L1_1 = "LowFi:Win32/MalDecoder"
                                L0_1 = L0_1(L1_1)
                                if not L0_1 then
                                  goto lbl_125
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
L0_1 = mp
L0_1 = L0_1.changedetectionname
L1_1 = 805306473
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.INFECTED
do return L0_1 end
::lbl_125::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
