local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
if L0_1 == nil or L0_1 == "" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = IsExcludedByImagePathMacOS
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[2]
    L3_1 = L3_1.utf8p2
    L2_1 = L2_1(L3_1)
    L1_1 = L2_1
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= nil then
      L2_1 = string
      L2_1 = L2_1.lower
      L3_1 = this_sigattrlog
      L3_1 = L3_1[3]
      L3_1 = L3_1.utf8p2
      L2_1 = L2_1(L3_1)
      L1_1 = L2_1
  end
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[4]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[4]
      L2_1 = L2_1.utf8p2
      if L2_1 ~= nil then
        L2_1 = string
        L2_1 = L2_1.lower
        L3_1 = this_sigattrlog
        L3_1 = L3_1[4]
        L3_1 = L3_1.utf8p2
        L2_1 = L2_1(L3_1)
        L1_1 = L2_1
    end
    else
      L2_1 = this_sigattrlog
      L2_1 = L2_1[5]
      L2_1 = L2_1.matched
      if L2_1 then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[5]
        L2_1 = L2_1.utf8p2
        if L2_1 ~= nil then
          L2_1 = string
          L2_1 = L2_1.lower
          L3_1 = this_sigattrlog
          L3_1 = L3_1[5]
          L3_1 = L3_1.utf8p2
          L2_1 = L2_1(L3_1)
          L1_1 = L2_1
      end
      else
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
    goto lbl_171
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_171::
L2_1 = IsExcludedByCmdlineMacOS
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = #L1_1
if 500 <= L2_1 then
  L2_1 = bm
  L2_1 = L2_1.trigger_sig
  L3_1 = "MacRunningLargeShellContentInCmd_GT500"
  L4_1 = L1_1
  L2_1(L3_1, L4_1)
end
L2_1 = #L1_1
if 1000 <= L2_1 then
  L2_1 = bm
  L2_1 = L2_1.trigger_sig
  L3_1 = "MacRunningLargeShellContentInCmd_GT1000"
  L4_1 = L1_1
  L2_1(L3_1, L4_1)
end
L2_1 = #L1_1
if 1500 <= L2_1 then
  L2_1 = bm
  L2_1 = L2_1.trigger_sig
  L3_1 = "MacRunningLargeShellContentInCmd_GT1500"
  L4_1 = L1_1
  L2_1(L3_1, L4_1)
end
L2_1 = #L1_1
if 2000 <= L2_1 then
  L2_1 = bm
  L2_1 = L2_1.trigger_sig
  L3_1 = "MacRunningLargeShellContentInCmd_GT2000"
  L4_1 = L1_1
  L2_1(L3_1, L4_1)
end
L2_1 = #L1_1
if 2500 <= L2_1 then
  L2_1 = bm
  L2_1 = L2_1.trigger_sig
  L3_1 = "MacRunningLargeShellContentInCmd_GT2500"
  L4_1 = L1_1
  L2_1(L3_1, L4_1)
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
