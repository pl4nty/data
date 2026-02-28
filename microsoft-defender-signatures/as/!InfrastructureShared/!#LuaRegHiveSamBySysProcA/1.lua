local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_LOWERCASE
L0_1 = L0_1(L1_1)
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "\\device\\harddiskvolumeshadowcopy"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if not L1_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "\\system volume information\\_restore"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "\\ifm\\registry\\"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "\\ntuser.dat"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if not L1_1 then
        L1_1 = string
        L1_1 = L1_1.find
        L2_1 = L0_1
        L3_1 = "\\windows\\system32\\config\\s"
        L4_1 = 1
        L5_1 = true
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if not L1_1 then
          L1_1 = string
          L1_1 = L1_1.find
          L2_1 = L0_1
          L3_1 = "\\windows\\system32\\config\\regback\\s"
          L4_1 = 1
          L5_1 = true
          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
          if not L1_1 then
            L1_1 = string
            L1_1 = L1_1.find
            L2_1 = L0_1
            L3_1 = "\\windows\\hkey_local_machine\\"
            L4_1 = 1
            L5_1 = true
            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
            if not L1_1 then
              L1_1 = string
              L1_1 = L1_1.find
              L2_1 = L0_1
              L3_1 = "\\sppcbshivestore\\"
              L4_1 = 1
              L5_1 = true
              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
              if not L1_1 then
                goto lbl_81
              end
            end
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_81::
L1_1 = string
L1_1 = L1_1.sub
L2_1 = L0_1
L3_1 = 0
L4_1 = 4
L1_1 = L1_1(L2_1, L3_1, L4_1)
if L1_1 == "\\\\?\\" then
  L1_1 = string
  L1_1 = L1_1.sub
  L2_1 = L0_1
  L3_1 = 5
  L1_1 = L1_1(L2_1, L3_1)
  L0_1 = L1_1
end
L2_1 = L0_1
L1_1 = L0_1.sub
L3_1 = 1
L4_1 = 8
L1_1 = L1_1(L2_1, L3_1, L4_1)
if L1_1 == "\\device\\" then
  L1_1 = MpCommon
  L1_1 = L1_1.PathToWin32Path
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  L0_1 = L1_1
  if L0_1 == nil then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  L0_1 = L1_1
end
L1_1 = {}
L2_1 = table
L2_1 = L2_1.insert
L3_1 = L1_1
L4_1 = L0_1
L2_1(L3_1, L4_1)
L2_1 = MpCommon
L2_1 = L2_1.SetPersistContextNoPath
L3_1 = "RegHiveSamBySysProc"
L4_1 = L1_1
L5_1 = 0
L2_1(L3_1, L4_1, L5_1)
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
