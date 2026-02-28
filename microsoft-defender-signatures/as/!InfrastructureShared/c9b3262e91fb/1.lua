local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L0_1 = L2_1.ppid
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L0_1 = L2_1.ppid
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[3]
      L0_1 = L2_1.ppid
    else
      L2_1 = this_sigattrlog
      L2_1 = L2_1[4]
      L2_1 = L2_1.matched
      if L2_1 then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[4]
        L0_1 = L2_1.ppid
      else
        L2_1 = this_sigattrlog
        L2_1 = L2_1[5]
        L2_1 = L2_1.matched
        if L2_1 then
          L2_1 = this_sigattrlog
          L2_1 = L2_1[5]
          L0_1 = L2_1.ppid
        else
          L2_1 = this_sigattrlog
          L2_1 = L2_1[6]
          L2_1 = L2_1.matched
          if L2_1 then
            L2_1 = this_sigattrlog
            L2_1 = L2_1[6]
            L0_1 = L2_1.ppid
          end
        end
      end
    end
  end
end
L2_1 = this_sigattrlog
L2_1 = L2_1[7]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = this_sigattrlog
  L3_1 = L3_1[7]
  L3_1 = L3_1.utf8p1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
end
if L0_1 ~= nil and L1_1 ~= nil then
  L2_1 = bm
  L2_1 = L2_1.get_process_notifications
  L3_1 = L0_1
  L2_1 = L2_1(L3_1)
  if L2_1 ~= nil then
    L3_1 = ipairs
    L4_1 = L2_1
    L3_1, L4_1, L5_1 = L3_1(L4_1)
    for L6_1, L7_1 in L3_1, L4_1, L5_1 do
      L8_1 = L7_1.tag
      L9_1 = bm
      L9_1 = L9_1.ActionTagFileCreate
      if L8_1 == L9_1 then
        L8_1 = string
        L8_1 = L8_1.lower
        L9_1 = L7_1.rawutf8p1
        L8_1 = L8_1(L9_1)
        if L8_1 == L1_1 then
          L8_1 = TrackPidAndTechniqueBM
          L9_1 = "BM"
          L10_1 = "T1105"
          L11_1 = "CommandAndControl"
          L8_1(L9_1, L10_1, L11_1)
          L8_1 = bm
          L8_1 = L8_1.trigger_sig
          L9_1 = "BMFileDropExec"
          L10_1 = this_sigattrlog
          L10_1 = L10_1[7]
          L10_1 = L10_1.utf8p1
          L8_1(L9_1, L10_1)
          L8_1 = mp
          L8_1 = L8_1.INFECTED
          return L8_1
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
