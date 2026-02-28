local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
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
if 20000000 < L1_1 then
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
L4_1 = string
L4_1 = L4_1.match
L5_1 = L0_1
L6_1 = "^/home/"
L4_1 = L4_1(L5_1, L6_1)
if not L4_1 then
  L4_1 = string
  L4_1 = L4_1.match
  L5_1 = L0_1
  L6_1 = "^/root/"
  L4_1 = L4_1(L5_1, L6_1)
  if not L4_1 then
    L4_1 = string
    L4_1 = L4_1.match
    L5_1 = L0_1
    L6_1 = "^/tmp/"
    L4_1 = L4_1(L5_1, L6_1)
    if not L4_1 then
      L4_1 = string
      L4_1 = L4_1.match
      L5_1 = L0_1
      L6_1 = "^/var/"
      L4_1 = L4_1(L5_1, L6_1)
      if not L4_1 then
        L4_1 = string
        L4_1 = L4_1.match
        L5_1 = L0_1
        L6_1 = "^/dev/shm/"
        L4_1 = L4_1(L5_1, L6_1)
        if not L4_1 then
          goto lbl_124
        end
      end
    end
  end
end
L4_1 = bm
L4_1 = L4_1.trigger_sig
L5_1 = "BMExecutionFromScriptInSuspLocation"
L6_1 = L0_1
L4_1(L5_1, L6_1)
L4_1 = mp
L4_1 = L4_1.INFECTED
do return L4_1 end
::lbl_124::
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
