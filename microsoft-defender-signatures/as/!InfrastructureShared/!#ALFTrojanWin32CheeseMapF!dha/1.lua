local L0_1, L1_1, L2_1
L0_1 = mp
L0_1 = L0_1.readu_u16
L1_1 = headerpage
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == 10558 then
  L0_1 = mp
  L0_1 = L0_1.readprotection
  L1_1 = false
  L0_1(L1_1)
  L0_1 = mp
  L0_1 = L0_1.readfile
  L1_1 = 78
  L2_1 = 38
  L0_1 = L0_1(L1_1, L2_1)
  L1_1 = "1\015\b\022R\023\001\028\003\020\018\005G\a\a\023\026\n\021R\022\002E\000\001\006G\027\vG%*!G\030\028\000\003"
  if L0_1 == L1_1 then
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
