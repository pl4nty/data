local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L1_1 = this_sigattrlog
L1_1 = L1_1[22]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[22]
  L1_1 = L1_1.wp2
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[22]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[23]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[23]
    L1_1 = L1_1.wp2
    if L1_1 ~= nil then
      L1_1 = string
      L1_1 = L1_1.lower
      L2_1 = this_sigattrlog
      L2_1 = L2_1[23]
      L2_1 = L2_1.utf8p2
      L1_1 = L1_1(L2_1)
      L0_1 = L1_1
    end
  end
end

function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = 0
  L1_2 = bm
  L1_2 = L1_2.get_current_process_startup_info
  L1_2 = L1_2()
  L2_2 = mp
  L2_2 = L2_2.GetParentProcInfo
  L3_2 = L1_2.ppid
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil then
    L3_2 = GetTechniquesCountForPid
    L4_2 = L2_2.ppid
    L3_2 = L3_2(L4_2)
    L0_2 = L3_2
    if 4 < L0_2 then
      L3_2 = TrackPidAndTechniqueBM
      L4_2 = L2_2.ppid
      L5_2 = "T1083"
      L6_2 = "Discovery_FileAndDirectoryDiscovery"
      L3_2(L4_2, L5_2, L6_2)
      L3_2 = addRelatedProcess
      L3_2()
      L3_2 = reportRelatedBmHits
      L3_2()
      L3_2 = true
      return L3_2
    end
  end
  L3_2 = false
  return L3_2
end

checkTaint = L1_1
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "-perm"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 then
    L1_1 = string
    L1_1 = L1_1.match
    L2_1 = L0_1
    L3_1 = "(%s)[-/](0*)200[07]"
    L1_1 = L1_1(L2_1, L3_1)
    if not L1_1 then
      L1_1 = string
      L1_1 = L1_1.match
      L2_1 = L0_1
      L3_1 = "(%s)-(0*)400[07]"
      L1_1 = L1_1(L2_1, L3_1)
      if not L1_1 then
        L1_1 = string
        L1_1 = L1_1.match
        L2_1 = L0_1
        L3_1 = "(%s)-(0*)6000"
        L1_1 = L1_1(L2_1, L3_1)
        if not L1_1 then
          L1_1 = string
          L1_1 = L1_1.match
          L2_1 = L0_1
          L3_1 = "(%s)-(0*)222"
          L1_1 = L1_1(L2_1, L3_1)
          if not L1_1 then
            L1_1 = string
            L1_1 = L1_1.match
            L2_1 = L0_1
            L3_1 = "(%s)-(0*)0002"
            L1_1 = L1_1(L2_1, L3_1)
            if not L1_1 then
              L1_1 = string
              L1_1 = L1_1.find
              L2_1 = L0_1
              L3_1 = "u=s"
              L4_1 = 1
              L5_1 = true
              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
              if not L1_1 then
                L1_1 = string
                L1_1 = L1_1.find
                L2_1 = L0_1
                L3_1 = "g=s"
                L4_1 = 1
                L5_1 = true
                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                if not L1_1 then
                  L1_1 = string
                  L1_1 = L1_1.find
                  L2_1 = L0_1
                  L3_1 = "-o w"
                  L4_1 = 1
                  L5_1 = true
                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                  if not L1_1 then
                    L1_1 = string
                    L1_1 = L1_1.find
                    L2_1 = L0_1
                    L3_1 = "-o x"
                    L4_1 = 1
                    L5_1 = true
                    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                    if not L1_1 then
                      goto lbl_128
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    L1_1 = checkTaint
    L1_1 = L1_1()
    if L1_1 == true then
      L1_1 = mp
      L1_1 = L1_1.INFECTED
      return L1_1
    end
  else
    ::lbl_128::
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = " -writable "
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if L1_1 then
      L1_1 = string
      L1_1 = L1_1.match
      L2_1 = L0_1
      L3_1 = "(%s)-type%s+[fd]"
      L1_1 = L1_1(L2_1, L3_1)
      if not L1_1 then
        L1_1 = string
        L1_1 = L1_1.find
        L2_1 = L0_1
        L3_1 = "-not -user"
        L4_1 = 1
        L5_1 = true
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if not L1_1 then
          goto lbl_160
        end
      end
      L1_1 = checkTaint
      L1_1 = L1_1()
      if L1_1 then
        L1_1 = mp
        L1_1 = L1_1.INFECTED
        return L1_1
      end
    end
  end
end
::lbl_160::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
