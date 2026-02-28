local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p2
  if L0_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.len
    L2_1 = L0_1
    L1_1 = L1_1(L2_1)
    if 3 < L1_1 then
      L1_1 = string
      L1_1 = L1_1.lower
      L2_1 = L0_1
      L1_1 = L1_1(L2_1)
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L1_1
      L4_1 = "shell32"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if L2_1 ~= nil then
        L2_1 = string
        L2_1 = L2_1.find
        L3_1 = L1_1
        L4_1 = "shellexec_rundll"
        L5_1 = 1
        L6_1 = true
        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
        if L2_1 ~= nil then
          L2_1 = string
          L2_1 = L2_1.find
          L3_1 = L1_1
          L4_1 = ":\\programdata\\"
          L5_1 = 1
          L6_1 = true
          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
          if L2_1 ~= nil then
            L2_1 = string
            L2_1 = L2_1.find
            L3_1 = L1_1
            L4_1 = "msiexec"
            L5_1 = 1
            L6_1 = true
            L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
            if L2_1 == nil then
              L2_1 = string
              L2_1 = L2_1.find
              L3_1 = L1_1
              L4_1 = "odbcconf"
              L5_1 = 1
              L6_1 = true
              L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
              if L2_1 == nil then
                L2_1 = string
                L2_1 = L2_1.find
                L3_1 = L1_1
                L4_1 = "control.exe"
                L5_1 = 1
                L6_1 = true
                L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                if L2_1 == nil then
                  goto lbl_81
                end
              end
            end
            L2_1 = bm_AddRelatedFileFromCommandLine
            L3_1 = L0_1
            L2_1(L3_1)
            L2_1 = mp
            L2_1 = L2_1.INFECTED
            return L2_1
          end
        end
      end
    end
  end
end
::lbl_81::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
