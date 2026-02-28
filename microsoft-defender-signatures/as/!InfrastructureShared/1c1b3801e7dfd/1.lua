local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.ppid
if L1_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = isParentPackageManager
L2_1 = L0_1.ppid
L3_1 = true
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L1_1 = nil
  L2_1 = this_sigattrlog
  L2_1 = L2_1[8]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[8]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= nil then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[8]
      L1_1 = L2_1.utf8p2
  end
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[9]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[9]
      L2_1 = L2_1.utf8p1
      if L2_1 ~= nil then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[9]
        L1_1 = L2_1.utf8p1
        L2_1 = nil
        L3_1 = this_sigattrlog
        L3_1 = L3_1[12]
        L3_1 = L3_1.matched
        if L3_1 then
          L3_1 = this_sigattrlog
          L3_1 = L3_1[12]
          L3_1 = L3_1.utf8p2
          if L3_1 ~= nil then
            L3_1 = this_sigattrlog
            L3_1 = L3_1[12]
            L2_1 = L3_1.utf8p2
        end
        else
          L3_1 = this_sigattrlog
          L3_1 = L3_1[15]
          L3_1 = L3_1.matched
          if L3_1 then
            L3_1 = this_sigattrlog
            L3_1 = L3_1[15]
            L3_1 = L3_1.utf8p2
            if L3_1 ~= nil then
              L3_1 = this_sigattrlog
              L3_1 = L3_1[15]
              L2_1 = L3_1.utf8p2
            end
          end
        end
        if L1_1 ~= L2_1 then
          L3_1 = mp
          L3_1 = L3_1.CLEAN
          return L3_1
        end
      end
    end
  end
  if L1_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.match
    L3_1 = L1_1
    L4_1 = "/%.[^/]+$"
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 then
      L2_1 = TrackPidAndTechniqueBM
      L3_1 = "BM"
      L4_1 = "T1059.004"
      L5_1 = "Execution_CommandandScriptingInterpreter_UnixShell_HiddenParent"
      L2_1(L3_1, L4_1, L5_1)
      L2_1 = bm
      L2_1 = L2_1.add_related_file
      L3_1 = L1_1
      L2_1(L3_1)
      L2_1 = reportRelatedBmHits
      L2_1()
      L2_1 = addRelatedProcess
      L2_1()
      L2_1 = mp
      L2_1 = L2_1.INFECTED
      return L2_1
    end
  else
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
