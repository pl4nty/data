local L0_1, L1_1, L2_1, L3_1
L0_1 = peattributes
L0_1 = L0_1.isexe
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.isdriver
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.no_security
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.packed
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.packersigmatched
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.hasstandardentry
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.epinfirstsect
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.suspicious_timestamp
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.no_debug
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.TimeDateStamp
if L0_1 ~= 0 then
  L0_1 = pehdr
  L0_1 = L0_1.TimeDateStamp
  if L0_1 ~= -1 then
    goto lbl_75
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_75::
L0_1 = string
L0_1 = L0_1.find
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.getfilename
L2_1, L3_1 = L2_1()
L1_1 = L1_1(L2_1, L3_1)
L2_1 = ".exe$"
L0_1 = L0_1(L1_1, L2_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 4096 or 16777216 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = MpCommon
L1_1 = L1_1.GetCurrentTimeT
L1_1 = L1_1()
if L1_1 == nil or L1_1 == 0 or L1_1 == -1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = pehdr
L2_1 = L2_1.TimeDateStamp
L3_1 = L1_1 + 2621440
if L2_1 > L3_1 then
  L2_1 = mp
  L2_1 = L2_1.LOWFI
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
