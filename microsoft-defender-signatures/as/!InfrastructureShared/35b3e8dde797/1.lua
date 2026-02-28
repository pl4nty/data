local L0_1, L1_1, L2_1, L3_1, L4_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L0_1 = L1_1.utf8p1
end
L1_1 = string
L1_1 = L1_1.sub
L2_1 = L0_1
L3_1 = 0
L4_1 = 5
L1_1 = L1_1(L2_1, L3_1, L4_1)
if L1_1 ~= "/tmp/" then
  L1_1 = string
  L1_1 = L1_1.sub
  L2_1 = L0_1
  L3_1 = 0
  L4_1 = 9
  L1_1 = L1_1(L2_1, L3_1, L4_1)
  if L1_1 ~= "/var/tmp/" then
    L1_1 = string
    L1_1 = L1_1.sub
    L2_1 = L0_1
    L3_1 = 0
    L4_1 = 9
    L1_1 = L1_1(L2_1, L3_1, L4_1)
    if L1_1 ~= "/dev/shm/" then
      L1_1 = string
      L1_1 = L1_1.sub
      L2_1 = L0_1
      L3_1 = 0
      L4_1 = 10
      L1_1 = L1_1(L2_1, L3_1, L4_1)
      if L1_1 ~= "/var/mail/" then
        L1_1 = string
        L1_1 = L1_1.sub
        L2_1 = L0_1
        L3_1 = 0
        L4_1 = 16
        L1_1 = L1_1(L2_1, L3_1, L4_1)
        if L1_1 ~= "/var/spool/mail/" then
          L1_1 = string
          L1_1 = L1_1.sub
          L2_1 = L0_1
          L3_1 = 0
          L4_1 = 10
          L1_1 = L1_1(L2_1, L3_1, L4_1)
          if L1_1 ~= "/var/lock/" then
            L1_1 = string
            L1_1 = L1_1.sub
            L2_1 = L0_1
            L3_1 = 0
            L4_1 = 6
            L1_1 = L1_1(L2_1, L3_1, L4_1)
            if L1_1 ~= "/home/" then
              goto lbl_73
            end
          end
        end
      end
    end
  end
end
L1_1 = TrackPidAndTechniqueBM
L2_1 = "BM"
L3_1 = "T1486"
L4_1 = "Impact_Ransom"
L1_1(L2_1, L3_1, L4_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
do return L1_1 end
::lbl_73::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
