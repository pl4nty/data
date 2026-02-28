local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[2]
    L0_1 = L0_1.utf8p1
    if L0_1 ~= "" then
      goto lbl_19
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_19::
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.utf8p1
L1_1 = SuspMacPathsToMonitor
L2_1 = L0_1
L3_1 = true
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "/Users/[^/]+/Downloads/"
  L4_1 = 1
  L5_1 = false
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "/Users/[^/]+/Documents/"
    L4_1 = 1
    L5_1 = false
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "/Users/[^/]+/Desktop/"
      L4_1 = 1
      L5_1 = false
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if not L1_1 then
        goto lbl_63
      end
    end
  end
end
L1_1 = TrackPidAndTechniqueBM
L2_1 = "BM"
L3_1 = "T1204.002"
L4_1 = "Execution_UserExecution_MaliciousFile"
L1_1(L2_1, L3_1, L4_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
do return L1_1 end
::lbl_63::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
