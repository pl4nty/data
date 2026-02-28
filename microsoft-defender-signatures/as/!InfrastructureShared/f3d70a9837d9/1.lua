local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = isnull
  L2_1 = L0_1.image_path
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1.image_path
    L3_1 = "/node"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if L1_1 then
      L1_1 = mp
      L1_1 = L1_1.GetScannedPPID
      L1_1 = L1_1()
      L2_1 = isnull
      L3_1 = L1_1
      L2_1 = L2_1(L3_1)
      if L2_1 then
        L2_1 = mp
        L2_1 = L2_1.CLEAN
        return L2_1
      end
      L2_1 = MpCommon
      L2_1 = L2_1.GetImagePathFromPid
      L3_1 = L1_1
      L2_1 = L2_1(L3_1)
      L3_1 = string
      L3_1 = L3_1.find
      L4_1 = L2_1
      L5_1 = "/sh"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if not L3_1 then
        L3_1 = string
        L3_1 = L3_1.find
        L4_1 = L2_1
        L5_1 = "/bash"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if not L3_1 then
          L3_1 = string
          L3_1 = L3_1.find
          L4_1 = L2_1
          L5_1 = "/dash"
          L6_1 = 1
          L7_1 = true
          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
          if not L3_1 then
            L3_1 = string
            L3_1 = L3_1.find
            L4_1 = L2_1
            L5_1 = "/busybox"
            L6_1 = 1
            L7_1 = true
            L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
            if not L3_1 then
              goto lbl_156
            end
          end
        end
      end
      L3_1 = string
      L3_1 = L3_1.lower
      L4_1 = mp
      L4_1 = L4_1.GetProcessCommandLine
      L5_1 = L1_1
      L4_1, L5_1, L6_1, L7_1, L8_1 = L4_1(L5_1)
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
      L4_1 = isnull
      L5_1 = L3_1
      L4_1 = L4_1(L5_1)
      if L4_1 then
        L4_1 = mp
        L4_1 = L4_1.CLEAN
        return L4_1
      end
      L4_1 = string
      L4_1 = L4_1.match
      L5_1 = L3_1
      L6_1 = "https?://"
      L4_1 = L4_1(L5_1, L6_1)
      if L4_1 then
        L4_1 = string
        L4_1 = L4_1.find
        L5_1 = L3_1
        L6_1 = "chmod +x"
        L7_1 = 1
        L8_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
        if not L4_1 then
          L4_1 = string
          L4_1 = L4_1.find
          L5_1 = L3_1
          L6_1 = "chmod 777"
          L7_1 = 1
          L8_1 = true
          L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
          if not L4_1 then
            goto lbl_117
          end
        end
        L4_1 = mp
        L4_1 = L4_1.INFECTED
        do return L4_1 end
        ::lbl_117::
        L4_1 = string
        L4_1 = L4_1.find
        L5_1 = L3_1
        L6_1 = "|sh"
        L7_1 = 1
        L8_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
        if not L4_1 then
          L4_1 = string
          L4_1 = L4_1.find
          L5_1 = L3_1
          L6_1 = "| sh"
          L7_1 = 1
          L8_1 = true
          L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
          if not L4_1 then
            L4_1 = string
            L4_1 = L4_1.find
            L5_1 = L3_1
            L6_1 = "|bash"
            L7_1 = 1
            L8_1 = true
            L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
            if not L4_1 then
              L4_1 = string
              L4_1 = L4_1.find
              L5_1 = L3_1
              L6_1 = "| bash"
              L7_1 = 1
              L8_1 = true
              L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
              if not L4_1 then
                goto lbl_156
              end
            end
          end
        end
        L4_1 = mp
        L4_1 = L4_1.INFECTED
        return L4_1
      end
    end
  end
end
::lbl_156::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
