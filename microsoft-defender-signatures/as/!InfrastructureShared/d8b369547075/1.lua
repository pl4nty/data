local L0_1, L1_1, L2_1, L3_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = contains
L2_1 = L0_1
L3_1 = "powershell"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L1_1 = contains
  L2_1 = L0_1
  L3_1 = "cmd.exe"
  L1_1 = L1_1(L2_1, L3_1)
  if not L1_1 then
    L1_1 = contains
    L2_1 = L0_1
    L3_1 = "wscript"
    L1_1 = L1_1(L2_1, L3_1)
    if not L1_1 then
      L1_1 = contains
      L2_1 = L0_1
      L3_1 = "mshta"
      L1_1 = L1_1(L2_1, L3_1)
      if not L1_1 then
        L1_1 = contains
        L2_1 = L0_1
        L3_1 = "jscript"
        L1_1 = L1_1(L2_1, L3_1)
        if not L1_1 then
          L1_1 = contains
          L2_1 = L0_1
          L3_1 = "wmic"
          L1_1 = L1_1(L2_1, L3_1)
          if not L1_1 then
            L1_1 = contains
            L2_1 = L0_1
            L3_1 = "rundll32"
            L1_1 = L1_1(L2_1, L3_1)
            if not L1_1 then
              L1_1 = contains
              L2_1 = L0_1
              L3_1 = "regsvr32"
              L1_1 = L1_1(L2_1, L3_1)
              if not L1_1 then
                goto lbl_77
              end
            end
          end
        end
      end
    end
  end
end
L1_1 = bm_AddRelatedFileFromCommandLine
L2_1 = L0_1
L1_1(L2_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
do return L1_1 end
::lbl_77::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
