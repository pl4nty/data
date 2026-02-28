local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FNAME
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_PATH
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L1_1(L2_1, L3_1)
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
if L0_1 ~= nil then
  L3_1 = L0_1
  L2_1 = L0_1.len
  L2_1 = L2_1(L3_1)
  if 10 < L2_1 and L1_1 ~= nil then
    L3_1 = L1_1
    L2_1 = L1_1.len
    L2_1 = L2_1(L3_1)
    if 31 < L2_1 then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L0_1
      L4_1 = "\\backup"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if not L2_1 then
        L2_1 = string
        L2_1 = L2_1.find
        L3_1 = L0_1
        L4_1 = "cache\\"
        L5_1 = 1
        L6_1 = true
        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
        if not L2_1 then
          L2_1 = string
          L2_1 = L2_1.find
          L3_1 = L0_1
          L4_1 = ".git\\"
          L5_1 = 1
          L6_1 = true
          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
          if not L2_1 then
            L2_1 = string
            L2_1 = L2_1.find
            L3_1 = L0_1
            L4_1 = "\\programdata\\"
            L5_1 = 1
            L6_1 = true
            L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
            if not L2_1 then
              L2_1 = string
              L2_1 = L2_1.find
              L3_1 = L0_1
              L4_1 = "\\appdata\\local\\temp\\tencent\\"
              L5_1 = 1
              L6_1 = true
              L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
              if not L2_1 then
                L2_1 = string
                L2_1 = L2_1.find
                L3_1 = L0_1
                L4_1 = ":\\windows\\system32\\grouppolicy\\"
                L5_1 = 1
                L6_1 = true
                L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                if not L2_1 then
                  L2_1 = string
                  L2_1 = L2_1.find
                  L3_1 = L0_1
                  L4_1 = "\\system recovery\\"
                  L5_1 = 1
                  L6_1 = true
                  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                  if not L2_1 then
                    L2_1 = string
                    L2_1 = L2_1.find
                    L3_1 = L1_1
                    L4_1 = ".cache"
                    L5_1 = 1
                    L6_1 = true
                    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                    if not L2_1 then
                      L2_1 = string
                      L2_1 = L2_1.find
                      L3_1 = L1_1
                      L4_1 = ".error"
                      L5_1 = 1
                      L6_1 = true
                      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                      if not L2_1 then
                        L2_1 = string
                        L2_1 = L2_1.find
                        L3_1 = L0_1
                        L4_1 = "\\recovered data\\"
                        L5_1 = 1
                        L6_1 = true
                        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                        if not L2_1 then
                          L2_1 = string
                          L2_1 = L2_1.find
                          L3_1 = L0_1
                          L4_1 = "\\mscrm_rw\\assemblycache\\"
                          L5_1 = 1
                          L6_1 = true
                          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                          if not L2_1 then
                            L2_1 = string
                            L2_1 = L2_1.find
                            L3_1 = L0_1
                            L4_1 = "\\server\\microsoftdynamicsnavserver"
                            L5_1 = 1
                            L6_1 = true
                            L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                            if not L2_1 then
                              L2_1 = string
                              L2_1 = L2_1.find
                              L3_1 = L0_1
                              L4_1 = ":\\sysmon\\"
                              L5_1 = 1
                              L6_1 = true
                              L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                              if not L2_1 then
                                L2_1 = string
                                L2_1 = L2_1.find
                                L3_1 = L0_1
                                L4_1 = ":\\falsepos\\"
                                L5_1 = 1
                                L6_1 = true
                                L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                                if not L2_1 then
                                  goto lbl_161
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
      L2_1 = mp
      L2_1 = L2_1.set_mpattribute
      L3_1 = "Lua:ExceptionPathPE"
      L2_1(L3_1)
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      do return L2_1 end
      ::lbl_161::
      L2_1 = string
      L2_1 = L2_1.sub
      L3_1 = L1_1
      L4_1 = -5
      L2_1 = L2_1(L3_1, L4_1)
      L4_1 = L2_1
      L3_1 = L2_1.find
      L5_1 = "."
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if not L3_1 then
        L3_1 = mp
        L3_1 = L3_1.CLEAN
        return L3_1
      end
      L4_1 = L1_1
      L3_1 = L1_1.match
      L5_1 = "^[0-9a-f]+"
      L3_1 = L3_1(L4_1, L5_1)
      if L3_1 == nil then
        L4_1 = mp
        L4_1 = L4_1.CLEAN
        return L4_1
      end
      L5_1 = L3_1
      L4_1 = L3_1.len
      L4_1 = L4_1(L5_1)
      if not (L4_1 < 31) then
        L6_1 = L1_1
        L5_1 = L1_1.len
        L5_1 = L5_1(L6_1)
        L5_1 = L5_1 - 5
        if not (L4_1 < L5_1 or 80 < L4_1) then
          goto lbl_198
        end
      end
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      do return L5_1 end
      ::lbl_198::
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = "//LuaSuspiciousFileNamePeExChild.B"
      L5_1(L6_1)
      L5_1 = mp
      L5_1 = L5_1.INFECTED
      return L5_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
