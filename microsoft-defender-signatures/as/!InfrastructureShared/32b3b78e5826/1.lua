local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L0_1 = L1_1.utf8p2
  end
end
L1_1 = {}
L2_1 = string
L2_1 = L2_1.gmatch
L3_1 = L0_1
L4_1 = "[^%s]+"
L2_1, L3_1, L4_1 = L2_1(L3_1, L4_1)
for L5_1 in L2_1, L3_1, L4_1 do
  L6_1 = table
  L6_1 = L6_1.insert
  L7_1 = L1_1
  L8_1 = L5_1
  L6_1(L7_1, L8_1)
end
L2_1 = {}
L3_1 = "/var/tmp/"
L4_1 = "/tmp/."
L5_1 = "/dev/shm/"
L6_1 = "/root/"
L7_1 = "/home/"
L8_1 = "/run/"
L9_1 = "/var/run/"
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L2_1[4] = L6_1
L2_1[5] = L7_1
L2_1[6] = L8_1
L2_1[7] = L9_1
L3_1 = {}
L4_1 = next
L5_1 = L1_1
L4_1 = L4_1(L5_1)
if L4_1 ~= nil then
  L4_1 = ipairs
  L5_1 = L2_1
  L4_1, L5_1, L6_1 = L4_1(L5_1)
  for L7_1, L8_1 in L4_1, L5_1, L6_1 do
    L9_1 = #L1_1
    L9_1 = L1_1[L9_1]
    L10_1 = L9_1
    L9_1 = L9_1.sub
    L11_1 = 1
    L12_1 = #L8_1
    L9_1 = L9_1(L10_1, L11_1, L12_1)
    if L9_1 == L8_1 then
      L9_1 = sysio
      L9_1 = L9_1.IsFileExists
      L10_1 = #L1_1
      L10_1 = L1_1[L10_1]
      L9_1 = L9_1(L10_1)
      if L9_1 then
        L9_1 = string
        L9_1 = L9_1.gmatch
        L10_1 = #L1_1
        L10_1 = L1_1[L10_1]
        L11_1 = "([^/]+)"
        L9_1, L10_1, L11_1 = L9_1(L10_1, L11_1)
        for L12_1 in L9_1, L10_1, L11_1 do
          L13_1 = table
          L13_1 = L13_1.insert
          L14_1 = L3_1
          L15_1 = L12_1
          L13_1(L14_1, L15_1)
        end
      end
    end
  end
end
L4_1 = next
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if L4_1 ~= nil then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = #L3_1
  L5_1 = L3_1[L5_1]
  L6_1 = "cron"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
