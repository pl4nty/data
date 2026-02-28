local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p1
    if L2_1 ~= "" then
      goto lbl_19
    end
  end
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  do return L2_1 end
  ::lbl_19::
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L0_1 = L2_1.utf8p1
  L1_1 = "/DAFOM%-tmp%w+$"
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.utf8p1
    if L2_1 ~= nil then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[2]
      L2_1 = L2_1.utf8p1
      if L2_1 ~= "" then
        goto lbl_42
      end
    end
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    do return L2_1 end
    ::lbl_42::
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L0_1 = L2_1.utf8p1
    L1_1 = "/Esilet%-tmp%w+$"
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[3]
      L2_1 = L2_1.utf8p1
      if L2_1 ~= nil then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[3]
        L2_1 = L2_1.utf8p1
        if L2_1 ~= "" then
          goto lbl_65
        end
      end
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      do return L2_1 end
      ::lbl_65::
      L2_1 = this_sigattrlog
      L2_1 = L2_1[3]
      L0_1 = L2_1.utf8p1
      L1_1 = "/silet%-tmp%w+$"
    else
      L2_1 = this_sigattrlog
      L2_1 = L2_1[4]
      L2_1 = L2_1.matched
      if L2_1 then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[4]
        L2_1 = L2_1.utf8p1
        if L2_1 ~= nil then
          L2_1 = this_sigattrlog
          L2_1 = L2_1[4]
          L2_1 = L2_1.utf8p1
          if L2_1 ~= "" then
            goto lbl_88
          end
        end
        L2_1 = mp
        L2_1 = L2_1.CLEAN
        do return L2_1 end
        ::lbl_88::
        L2_1 = this_sigattrlog
        L2_1 = L2_1[4]
        L0_1 = L2_1.utf8p1
        L1_1 = "/DAFOM%-tmp%w+$"
      else
        L2_1 = this_sigattrlog
        L2_1 = L2_1[5]
        L2_1 = L2_1.matched
        if L2_1 then
          L2_1 = this_sigattrlog
          L2_1 = L2_1[5]
          L2_1 = L2_1.utf8p1
          if L2_1 ~= nil then
            L2_1 = this_sigattrlog
            L2_1 = L2_1[5]
            L2_1 = L2_1.utf8p1
            if L2_1 ~= "" then
              goto lbl_111
            end
          end
          L2_1 = mp
          L2_1 = L2_1.CLEAN
          do return L2_1 end
          ::lbl_111::
          L2_1 = this_sigattrlog
          L2_1 = L2_1[5]
          L0_1 = L2_1.utf8p1
          L1_1 = "/Esilet%-tmp%w+$"
        else
          L2_1 = this_sigattrlog
          L2_1 = L2_1[6]
          L2_1 = L2_1.matched
          if L2_1 then
            L2_1 = this_sigattrlog
            L2_1 = L2_1[6]
            L2_1 = L2_1.utf8p1
            if L2_1 ~= nil then
              L2_1 = this_sigattrlog
              L2_1 = L2_1[6]
              L2_1 = L2_1.utf8p1
              if L2_1 ~= "" then
                goto lbl_134
              end
            end
            L2_1 = mp
            L2_1 = L2_1.CLEAN
            do return L2_1 end
            ::lbl_134::
            L2_1 = this_sigattrlog
            L2_1 = L2_1[6]
            L0_1 = L2_1.utf8p1
            L1_1 = "/silet%-tmp%w+$"
          end
        end
      end
    end
  end
end
L2_1 = string
L2_1 = L2_1.match
L3_1 = L0_1
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = bm
L2_1 = L2_1.get_process_relationships
L2_1, L3_1 = L2_1()
if L3_1 ~= nil then
  L4_1 = ipairs
  L5_1 = L3_1
  L4_1, L5_1, L6_1 = L4_1(L5_1)
  for L7_1, L8_1 in L4_1, L5_1, L6_1 do
    L9_1 = bm
    L9_1 = L9_1.trigger_sig
    L10_1 = "BmTraverseTreeBlockMac"
    L11_1 = "Detected"
    L12_1 = L8_1.ppid
    L9_1(L10_1, L11_1, L12_1)
  end
end
L4_1 = TrackPidAndTechniqueBM
L5_1 = "BM"
L6_1 = "T1059"
L7_1 = "Execution_CommandAndScriptingInterpreter_ExactMatch"
L4_1(L5_1, L6_1, L7_1)
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
