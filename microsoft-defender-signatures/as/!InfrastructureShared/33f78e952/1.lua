local L0_1, L1_1, L2_1
L0_1 = 0
L1_1 = hstrlog
L1_1 = L1_1[3]
L1_1 = L1_1.matched
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = hstrlog
L1_1 = L1_1[4]
L1_1 = L1_1.matched
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = hstrlog
L1_1 = L1_1[5]
L1_1 = L1_1.matched
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = hstrlog
L1_1 = L1_1[6]
L1_1 = L1_1.matched
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = hstrlog
L1_1 = L1_1[7]
L1_1 = L1_1.matched
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = hstrlog
L1_1 = L1_1[8]
L1_1 = L1_1.matched
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = hstrlog
L1_1 = L1_1[9]
L1_1 = L1_1.matched
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = hstrlog
L1_1 = L1_1[10]
L1_1 = L1_1.matched
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = 0
L2_1 = hstrlog
L2_1 = L2_1[11]
L2_1 = L2_1.matched
if L2_1 then
  L1_1 = L1_1 + 1
end
L2_1 = hstrlog
L2_1 = L2_1[12]
L2_1 = L2_1.matched
if L2_1 then
  L1_1 = L1_1 + 1
end
L2_1 = hstrlog
L2_1 = L2_1[13]
L2_1 = L2_1.matched
if L2_1 then
  L1_1 = L1_1 + 1
end
L2_1 = mp
L2_1 = L2_1.getfilesize
L2_1 = L2_1()
if L2_1 < 250000 then
  L2_1 = hstrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.matched
  if not L2_1 then
    L2_1 = hstrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.matched
    if not (L2_1 and 6 <= L0_1) and (not (6 <= L0_1) or L1_1 ~= 3) then
      goto lbl_93
    end
  end
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
::lbl_93::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
