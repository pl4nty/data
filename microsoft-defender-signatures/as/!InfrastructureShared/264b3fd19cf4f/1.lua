local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
L2_1 = L1_1.command_line
L3_1 = bm
L3_1 = L3_1.get_imagepath
L3_1 = L3_1()
L4_1 = IsExcludedByCmdlineMacOS
L5_1 = L2_1
L4_1 = L4_1(L5_1)
if not L4_1 then
  L4_1 = IsExcludedByImagePathMacOS
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  if not L4_1 then
    goto lbl_21
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_21::
L4_1 = this_sigattrlog
L4_1 = L4_1[4]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[4]
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[4]
    if L4_1 ~= "" then
      L4_1 = string
      L4_1 = L4_1.lower
      L5_1 = this_sigattrlog
      L5_1 = L5_1[4]
      L5_1 = L5_1.utf8p2
      L4_1 = L4_1(L5_1)
      L0_1 = L4_1
  end
end
else
  L4_1 = this_sigattrlog
  L4_1 = L4_1[5]
  L4_1 = L4_1.matched
  if L4_1 then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[5]
    if L4_1 ~= nil then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[5]
      if L4_1 ~= "" then
        L4_1 = string
        L4_1 = L4_1.lower
        L5_1 = this_sigattrlog
        L5_1 = L5_1[5]
        L5_1 = L5_1.utf8p2
        L4_1 = L4_1(L5_1)
        L0_1 = L4_1
    end
  end
  else
    L4_1 = this_sigattrlog
    L4_1 = L4_1[6]
    L4_1 = L4_1.matched
    if L4_1 then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[6]
      if L4_1 ~= nil then
        L4_1 = this_sigattrlog
        L4_1 = L4_1[6]
        if L4_1 ~= "" then
          L4_1 = string
          L4_1 = L4_1.lower
          L5_1 = this_sigattrlog
          L5_1 = L5_1[6]
          L5_1 = L5_1.utf8p2
          L4_1 = L4_1(L5_1)
          L0_1 = L4_1
      end
    end
    else
      L4_1 = this_sigattrlog
      L4_1 = L4_1[7]
      L4_1 = L4_1.matched
      if L4_1 then
        L4_1 = this_sigattrlog
        L4_1 = L4_1[7]
        if L4_1 ~= nil then
          L4_1 = this_sigattrlog
          L4_1 = L4_1[7]
          if L4_1 ~= "" then
            L4_1 = string
            L4_1 = L4_1.lower
            L5_1 = this_sigattrlog
            L5_1 = L5_1[7]
            L5_1 = L5_1.utf8p2
            L4_1 = L4_1(L5_1)
            L0_1 = L4_1
        end
      end
      else
        L4_1 = this_sigattrlog
        L4_1 = L4_1[8]
        L4_1 = L4_1.matched
        if L4_1 then
          L4_1 = this_sigattrlog
          L4_1 = L4_1[8]
          if L4_1 ~= nil then
            L4_1 = this_sigattrlog
            L4_1 = L4_1[8]
            if L4_1 ~= "" then
              L4_1 = string
              L4_1 = L4_1.lower
              L5_1 = this_sigattrlog
              L5_1 = L5_1[8]
              L5_1 = L5_1.utf8p2
              L4_1 = L4_1(L5_1)
              L0_1 = L4_1
          end
        end
        else
          L4_1 = this_sigattrlog
          L4_1 = L4_1[9]
          L4_1 = L4_1.matched
          if L4_1 then
            L4_1 = this_sigattrlog
            L4_1 = L4_1[9]
            if L4_1 ~= nil then
              L4_1 = this_sigattrlog
              L4_1 = L4_1[9]
              if L4_1 ~= "" then
                L4_1 = string
                L4_1 = L4_1.lower
                L5_1 = this_sigattrlog
                L5_1 = L5_1[9]
                L5_1 = L5_1.utf8p2
                L4_1 = L4_1(L5_1)
                L0_1 = L4_1
              end
            end
          end
        end
      end
    end
  end
end
if L0_1 == nil or L0_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.find
L5_1 = L0_1
L6_1 = "/system/library/launch"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if not L4_1 then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L0_1
  L6_1 = "/library/launchagents"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L0_1
    L6_1 = "/library/launchdaemons"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if not L4_1 then
      L4_1 = string
      L4_1 = L4_1.find
      L5_1 = L0_1
      L6_1 = "/library/preferences"
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if not L4_1 then
        goto lbl_201
      end
    end
  end
  L4_1 = TrackPidAndTechniqueBM
  L5_1 = "BM"
  L6_1 = "T1647"
  L7_1 = "DefenseEvasion_PlutilPlistFileModification"
  L4_1(L5_1, L6_1, L7_1)
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "BM_PlistModUsingPlutil"
  L4_1(L5_1)
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
::lbl_201::
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
