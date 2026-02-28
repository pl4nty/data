local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= nil then
    goto lbl_12
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_12::
L1_1 = isParentPackageManager
L2_1 = L0_1.ppid
L3_1 = true
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[6]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[6]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[6]
    L3_1 = L3_1.utf8p2
    L2_1 = L2_1(L3_1)
    L1_1 = L2_1
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[7]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[7]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= nil then
      L2_1 = string
      L2_1 = L2_1.lower
      L3_1 = this_sigattrlog
      L3_1 = L3_1[7]
      L3_1 = L3_1.utf8p2
      L2_1 = L2_1(L3_1)
      L1_1 = L2_1
  end
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[8]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[8]
      L2_1 = L2_1.utf8p2
      if L2_1 ~= nil then
        L2_1 = string
        L2_1 = L2_1.lower
        L3_1 = this_sigattrlog
        L3_1 = L3_1[8]
        L3_1 = L3_1.utf8p2
        L2_1 = L2_1(L3_1)
        L1_1 = L2_1
    end
    else
      L2_1 = this_sigattrlog
      L2_1 = L2_1[9]
      L2_1 = L2_1.matched
      if L2_1 then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[9]
        L2_1 = L2_1.utf8p2
        if L2_1 ~= nil then
          L2_1 = string
          L2_1 = L2_1.lower
          L3_1 = this_sigattrlog
          L3_1 = L3_1[9]
          L3_1 = L3_1.utf8p2
          L2_1 = L2_1(L3_1)
          L1_1 = L2_1
      end
      else
        L2_1 = this_sigattrlog
        L2_1 = L2_1[10]
        L2_1 = L2_1.matched
        if L2_1 then
          L2_1 = this_sigattrlog
          L2_1 = L2_1[10]
          L2_1 = L2_1.utf8p2
          if L2_1 ~= nil then
            L2_1 = string
            L2_1 = L2_1.lower
            L3_1 = this_sigattrlog
            L3_1 = L3_1[10]
            L3_1 = L3_1.utf8p2
            L2_1 = L2_1(L3_1)
            L1_1 = L2_1
        end
        else
          L2_1 = this_sigattrlog
          L2_1 = L2_1[11]
          L2_1 = L2_1.matched
          if L2_1 then
            L2_1 = this_sigattrlog
            L2_1 = L2_1[11]
            L2_1 = L2_1.utf8p2
            if L2_1 ~= nil then
              L2_1 = string
              L2_1 = L2_1.lower
              L3_1 = this_sigattrlog
              L3_1 = L3_1[11]
              L3_1 = L3_1.utf8p2
              L2_1 = L2_1(L3_1)
              L1_1 = L2_1
          end
          else
            L2_1 = this_sigattrlog
            L2_1 = L2_1[12]
            L2_1 = L2_1.matched
            if L2_1 then
              L2_1 = this_sigattrlog
              L2_1 = L2_1[12]
              L2_1 = L2_1.utf8p2
              if L2_1 ~= nil then
                L2_1 = string
                L2_1 = L2_1.lower
                L3_1 = this_sigattrlog
                L3_1 = L3_1[12]
                L3_1 = L3_1.utf8p2
                L2_1 = L2_1(L3_1)
                L1_1 = L2_1
            end
            else
              L2_1 = this_sigattrlog
              L2_1 = L2_1[13]
              L2_1 = L2_1.matched
              if L2_1 then
                L2_1 = this_sigattrlog
                L2_1 = L2_1[13]
                L2_1 = L2_1.utf8p2
                if L2_1 ~= nil then
                  L2_1 = string
                  L2_1 = L2_1.lower
                  L3_1 = this_sigattrlog
                  L3_1 = L3_1[13]
                  L3_1 = L3_1.utf8p2
                  L2_1 = L2_1(L3_1)
                  L1_1 = L2_1
              end
              else
                L2_1 = this_sigattrlog
                L2_1 = L2_1[14]
                L2_1 = L2_1.matched
                if L2_1 then
                  L2_1 = this_sigattrlog
                  L2_1 = L2_1[14]
                  L2_1 = L2_1.utf8p2
                  if L2_1 ~= nil then
                    L2_1 = string
                    L2_1 = L2_1.lower
                    L3_1 = this_sigattrlog
                    L3_1 = L3_1[14]
                    L3_1 = L3_1.utf8p2
                    L2_1 = L2_1(L3_1)
                    L1_1 = L2_1
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
if L1_1 ~= nil then
  L2_1 = #L1_1
  if not (L2_1 < 500) then
    goto lbl_191
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_191::
L2_1 = #L1_1
if 500 <= L2_1 then
  L2_1 = bm
  L2_1 = L2_1.trigger_sig
  L3_1 = "RunningLargeShellContentInCmd_GT500"
  L4_1 = L1_1
  L2_1(L3_1, L4_1)
end
L2_1 = #L1_1
if 1000 <= L2_1 then
  L2_1 = bm
  L2_1 = L2_1.trigger_sig
  L3_1 = "RunningLargeShellContentInCmd_GT1000"
  L4_1 = L1_1
  L2_1(L3_1, L4_1)
end
L2_1 = #L1_1
if 1500 <= L2_1 then
  L2_1 = bm
  L2_1 = L2_1.trigger_sig
  L3_1 = "RunningLargeShellContentInCmd_GT1500"
  L4_1 = L1_1
  L2_1(L3_1, L4_1)
end
L2_1 = #L1_1
if 2000 <= L2_1 then
  L2_1 = bm
  L2_1 = L2_1.trigger_sig
  L3_1 = "RunningLargeShellContentInCmd_GT2000"
  L4_1 = L1_1
  L2_1(L3_1, L4_1)
end
L2_1 = #L1_1
if 2500 <= L2_1 then
  L2_1 = bm
  L2_1 = L2_1.trigger_sig
  L3_1 = "RunningLargeShellContentInCmd_GT2500"
  L4_1 = L1_1
  L2_1(L3_1, L4_1)
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
