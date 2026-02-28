local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = nil
L2_1 = {}
L3_1 = {}
L4_1 = "/usr/bin/make"
L5_1 = ""
L3_1[1] = L4_1
L3_1[2] = L5_1
L4_1 = {}
L5_1 = "/usr/bin/ninja"
L6_1 = ""
L4_1[1] = L5_1
L4_1[2] = L6_1
L2_1[1] = L3_1
L2_1[2] = L4_1
L3_1 = this_sigattrlog
L3_1 = L3_1[1]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[1]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[1]
    L1_1 = L3_1.utf8p1
end
else
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[2]
    L3_1 = L3_1.utf8p1
    if L3_1 ~= nil then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[2]
      L1_1 = L3_1.utf8p1
  end
  else
    L3_1 = this_sigattrlog
    L3_1 = L3_1[3]
    L3_1 = L3_1.matched
    if L3_1 then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[3]
      L3_1 = L3_1.utf8p1
      if L3_1 ~= nil then
        L3_1 = this_sigattrlog
        L3_1 = L3_1[3]
        L1_1 = L3_1.utf8p1
    end
    else
      L3_1 = this_sigattrlog
      L3_1 = L3_1[4]
      L3_1 = L3_1.matched
      if L3_1 then
        L3_1 = this_sigattrlog
        L3_1 = L3_1[4]
        L3_1 = L3_1.utf8p1
        if L3_1 ~= nil then
          L3_1 = this_sigattrlog
          L3_1 = L3_1[4]
          L1_1 = L3_1.utf8p1
      end
      else
        L3_1 = this_sigattrlog
        L3_1 = L3_1[5]
        L3_1 = L3_1.matched
        if L3_1 then
          L3_1 = this_sigattrlog
          L3_1 = L3_1[5]
          L3_1 = L3_1.utf8p1
          if L3_1 ~= nil then
            L3_1 = this_sigattrlog
            L3_1 = L3_1[5]
            L1_1 = L3_1.utf8p1
        end
        else
          L3_1 = this_sigattrlog
          L3_1 = L3_1[6]
          L3_1 = L3_1.matched
          if L3_1 then
            L3_1 = this_sigattrlog
            L3_1 = L3_1[6]
            L3_1 = L3_1.utf8p1
            if L3_1 ~= nil then
              L3_1 = this_sigattrlog
              L3_1 = L3_1[6]
              L1_1 = L3_1.utf8p1
          end
          else
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
                L1_1 = L3_1.utf8p1
            end
            else
              L3_1 = this_sigattrlog
              L3_1 = L3_1[8]
              L3_1 = L3_1.matched
              if L3_1 then
                L3_1 = this_sigattrlog
                L3_1 = L3_1[8]
                L3_1 = L3_1.utf8p1
                if L3_1 ~= nil then
                  L3_1 = this_sigattrlog
                  L3_1 = L3_1[8]
                  L1_1 = L3_1.utf8p1
                end
              end
            end
          end
        end
      end
    end
  end
end
L3_1 = L0_1.ppid
if L3_1 and L1_1 then
  L3_1 = isParentPackageManager
  L4_1 = L0_1.ppid
  L5_1 = true
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    L3_1 = checkParentCmdline
    L4_1 = L0_1.ppid
    L5_1 = L2_1
    L6_1 = 3
    L3_1 = L3_1(L4_1, L5_1, L6_1)
    if not L3_1 then
      L3_1 = isTainted
      L4_1 = L1_1
      L5_1 = "remote_file_created_taint"
      L3_1 = L3_1(L4_1, L5_1)
      if L3_1 then
        goto lbl_153
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_153::
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
