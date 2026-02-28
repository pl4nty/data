local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = L0_1.command_line
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1 = L2_1()
L3_1 = IsExcludedByCmdlineMacOS
L4_1 = L1_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = IsExcludedByImagePathMacOS
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    goto lbl_21
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_21::
L4_1 = L1_1
L3_1 = L1_1.find
L5_1 = "gitlab-runner run --working-directory"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if not L3_1 then
  L4_1 = L1_1
  L3_1 = L1_1.find
  L5_1 = "www.istitutomarangoni.com"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if not L3_1 then
    L4_1 = L1_1
    L3_1 = L1_1.find
    L5_1 = "gitlab-runner run --working-directory"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if not L3_1 then
      L4_1 = L1_1
      L3_1 = L1_1.find
      L5_1 = "java -jar remoting.jar"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if not L3_1 then
        goto lbl_52
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_52::
L3_1 = this_sigattrlog
L3_1 = L3_1[7]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[7]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[7]
    L3_1 = L3_1.utf8p1
    if L3_1 ~= "" then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[7]
      L3_1 = L3_1.utf8p1
      L4_1 = SuspMacPathsToMonitor
      L5_1 = L3_1
      L6_1 = true
      L4_1 = L4_1(L5_1, L6_1)
      if L4_1 then
        L4_1 = mp
        L4_1 = L4_1.INFECTED
        return L4_1
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
