local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.image_path
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = string
    L2_1 = L2_1.sub
    L3_1 = L0_1.image_path
    L4_1 = -8
    L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L2_1(L3_1, L4_1)
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
    if L1_1 == "w3wp.exe" then
      L1_1 = L0_1.ppid
      if L1_1 == "" or L1_1 == nil then
        L2_1 = mp
        L2_1 = L2_1.CLEAN
        return L2_1
      end
      L2_1 = mp
      L2_1 = L2_1.GetProcessCommandLine
      L3_1 = L1_1
      L2_1 = L2_1(L3_1)
      if L2_1 == "" or L2_1 == nil then
        L3_1 = mp
        L3_1 = L3_1.CLEAN
        return L3_1
      end
      L3_1 = string
      L3_1 = L3_1.lower
      L4_1 = L2_1
      L3_1 = L3_1(L4_1)
      L2_1 = L3_1
      L3_1 = string
      L3_1 = L3_1.find
      L4_1 = L2_1
      L5_1 = "-ap \"lyncintfeature"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if not L3_1 then
        L3_1 = string
        L3_1 = L3_1.find
        L4_1 = L2_1
        L5_1 = "-ap \"lyncextfeature"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if not L3_1 then
          L3_1 = string
          L3_1 = L3_1.find
          L4_1 = L2_1
          L5_1 = "-ap \"lyncextreach"
          L6_1 = 1
          L7_1 = true
          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
          if not L3_1 then
            goto lbl_79
          end
        end
      end
      L3_1 = TrackPidAndTechnique
      L4_1 = L1_1
      L5_1 = "T1505.003"
      L6_1 = "webshell_parent_skype"
      L7_1 = 86400
      L3_1(L4_1, L5_1, L6_1, L7_1)
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
::lbl_79::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
