local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L2_1 = bm
L2_1 = L2_1.GetProcedureMatchDuration
L3_1 = 0
L2_1 = L2_1(L3_1)
L3_1 = bm
L3_1 = L3_1.GetProcedureMatchDuration
L4_1 = 1
L3_1 = L3_1(L4_1)
if L2_1 > L3_1 then
  L1_1 = L2_1 - L3_1
else
  L1_1 = L3_1 - L2_1
end
if 50000000 < L1_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = this_sigattrlog
L4_1 = L4_1[3]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[3]
  L0_1 = L4_1.utf8p1
else
  L4_1 = this_sigattrlog
  L4_1 = L4_1[4]
  L4_1 = L4_1.matched
  if L4_1 then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[4]
    L0_1 = L4_1.utf8p1
  else
    L4_1 = this_sigattrlog
    L4_1 = L4_1[5]
    L4_1 = L4_1.matched
    if L4_1 then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[5]
      L0_1 = L4_1.utf8p1
    else
      L4_1 = this_sigattrlog
      L4_1 = L4_1[6]
      L4_1 = L4_1.matched
      if L4_1 then
        L4_1 = this_sigattrlog
        L4_1 = L4_1[6]
        L0_1 = L4_1.utf8p1
      else
        L4_1 = this_sigattrlog
        L4_1 = L4_1[8]
        L4_1 = L4_1.matched
        if L4_1 then
          L4_1 = this_sigattrlog
          L4_1 = L4_1[8]
          L0_1 = L4_1.utf8p1
        else
          L4_1 = this_sigattrlog
          L4_1 = L4_1[7]
          L4_1 = L4_1.matched
          if L4_1 then
            L4_1 = this_sigattrlog
            L4_1 = L4_1[7]
            L0_1 = L4_1.utf8p1
          else
            L4_1 = this_sigattrlog
            L4_1 = L4_1[9]
            L4_1 = L4_1.matched
            if L4_1 then
              L4_1 = this_sigattrlog
              L4_1 = L4_1[9]
              L0_1 = L4_1.utf8p1
            end
          end
        end
      end
    end
  end
end
L4_1 = isTainted
L5_1 = L0_1
L6_1 = "remote_file_created_taint"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L0_1
  L6_1 = "/usr/lib/yum-plugins/enabled_repos_upload.py"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 == 1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = bm
  L4_1 = L4_1.get_current_process_startup_info
  L4_1 = L4_1()
  if L4_1 then
    L5_1 = L4_1.ppid
    if L5_1 then
      L5_1 = L4_1.ppid
      if L5_1 ~= "" then
        L5_1 = AppendToRollingQueue
        L6_1 = "queue_pid_taintfactory_a"
        L7_1 = L4_1.ppid
        L8_1 = 1
        L9_1 = 600
        L5_1(L6_1, L7_1, L8_1, L9_1)
        L5_1 = AppendToRollingQueue
        L6_1 = "queue_pid_tainted_scripts"
        L7_1 = L4_1.ppid
        L8_1 = L0_1
        L9_1 = 3600
        L10_1 = 500
        L5_1(L6_1, L7_1, L8_1, L9_1, L10_1)
        L5_1 = bm
        L5_1 = L5_1.trigger_sig
        L6_1 = "BMExecutionFromTaintedScript"
        L7_1 = L0_1
        L5_1(L6_1, L7_1)
        L5_1 = mp
        L5_1 = L5_1.INFECTED
        return L5_1
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
