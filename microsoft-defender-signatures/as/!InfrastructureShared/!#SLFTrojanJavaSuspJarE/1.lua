local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = sysio
L1_1 = L1_1.GetFileLastWriteTime
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L2_1 = sysio
L2_1 = L2_1.GetLastResult
L2_1 = L2_1()
L2_1 = L2_1.Success
if L2_1 and L1_1 and L1_1 ~= 0 then
  L2_1 = L1_1 / 10000000
  L1_1 = L2_1 - 11644473600
end
L2_1 = MpCommon
L2_1 = L2_1.GetCurrentTimeT
L2_1 = L2_1()
if L2_1 then
  if not (L1_1 > L2_1) then
    L3_1 = L2_1 - L1_1
    if not (345600 < L3_1) then
      goto lbl_41
    end
  end
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
::lbl_41::
L4_1 = L0_1
L3_1 = L0_1.match
L5_1 = "(.+\\)([^\\]+)$"
L3_1, L4_1 = L3_1(L4_1, L5_1)
if L3_1 == nil or L4_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.match
L6_1 = L3_1
L7_1 = "\\program files\\"
L5_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L5_1 = string
  L5_1 = L5_1.match
  L6_1 = L3_1
  L7_1 = "\\program files (x86)\\"
  L5_1 = L5_1(L6_1, L7_1)
  if not L5_1 then
    L5_1 = string
    L5_1 = L5_1.match
    L6_1 = L3_1
    L7_1 = "\\apache\\"
    L5_1 = L5_1(L6_1, L7_1)
    if not L5_1 then
      L5_1 = string
      L5_1 = L5_1.match
      L6_1 = L3_1
      L7_1 = "\\oracle\\"
      L5_1 = L5_1(L6_1, L7_1)
      if not L5_1 then
        L5_1 = string
        L5_1 = L5_1.match
        L6_1 = L3_1
        L7_1 = "\\eclipse\\"
        L5_1 = L5_1(L6_1, L7_1)
        if not L5_1 then
          L5_1 = string
          L5_1 = L5_1.match
          L6_1 = L3_1
          L7_1 = "\\org.eclipse."
          L5_1 = L5_1(L6_1, L7_1)
          if not L5_1 then
            L5_1 = string
            L5_1 = L5_1.match
            L6_1 = L3_1
            L7_1 = "\\netbeans\\"
            L5_1 = L5_1(L6_1, L7_1)
            if not L5_1 then
              L5_1 = string
              L5_1 = L5_1.match
              L6_1 = L3_1
              L7_1 = "\\onedrive\\"
              L5_1 = L5_1(L6_1, L7_1)
              if not L5_1 then
                L5_1 = string
                L5_1 = L5_1.match
                L6_1 = L3_1
                L7_1 = "\\modules\\"
                L5_1 = L5_1(L6_1, L7_1)
                if not L5_1 then
                  L5_1 = string
                  L5_1 = L5_1.match
                  L6_1 = L3_1
                  L7_1 = "\\lib\\"
                  L5_1 = L5_1(L6_1, L7_1)
                  if not L5_1 then
                    L5_1 = string
                    L5_1 = L5_1.match
                    L6_1 = L3_1
                    L7_1 = "\\repository\\"
                    L5_1 = L5_1(L6_1, L7_1)
                    if not L5_1 then
                      L5_1 = string
                      L5_1 = L5_1.match
                      L6_1 = L3_1
                      L7_1 = "\\plugin"
                      L5_1 = L5_1(L6_1, L7_1)
                      if not L5_1 then
                        L5_1 = string
                        L5_1 = L5_1.match
                        L6_1 = L3_1
                        L7_1 = "\\bin\\"
                        L5_1 = L5_1(L6_1, L7_1)
                        if not L5_1 then
                          L5_1 = string
                          L5_1 = L5_1.match
                          L6_1 = L3_1
                          L7_1 = "minecraft\\"
                          L5_1 = L5_1(L6_1, L7_1)
                          if not L5_1 then
                            goto lbl_153
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
L5_1 = mp
L5_1 = L5_1.set_mpattribute
L6_1 = "Lua:JarPathExclusionList"
L5_1(L6_1)
::lbl_153::
L5_1 = mp
L5_1 = L5_1.get_mpattribute
L6_1 = "LUA:FileSizeGT4M.A"
L5_1 = L5_1(L6_1)
if not L5_1 then
  L5_1 = mp
  L5_1 = L5_1.get_mpattribute
  L6_1 = "Lua:JarPathExclusionList"
  L5_1 = L5_1(L6_1)
  if not L5_1 then
    L5_1 = mp
    L5_1 = L5_1.get_mpattribute
    L6_1 = "Lua:HasMotw"
    L5_1 = L5_1(L6_1)
    if L5_1 then
      L5_1 = getAgePrev
      L6_1 = false
      L5_1, L6_1 = L5_1(L6_1)
      if L6_1 and L6_1 <= 100 then
        L7_1 = mp
        L7_1 = L7_1.INFECTED
        return L7_1
      end
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
