local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L1_1 = L1_1.utf8p2
    if L1_1 ~= nil then
      L1_1 = string
      L1_1 = L1_1.lower
      L2_1 = this_sigattrlog
      L2_1 = L2_1[2]
      L2_1 = L2_1.utf8p2
      L1_1 = L1_1(L2_1)
      L0_1 = L1_1
  end
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[3]
      L1_1 = L1_1.utf8p2
      if L1_1 ~= nil then
        L1_1 = string
        L1_1 = L1_1.lower
        L2_1 = this_sigattrlog
        L2_1 = L2_1[3]
        L2_1 = L2_1.utf8p2
        L1_1 = L1_1(L2_1)
        L0_1 = L1_1
    end
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[4]
      L1_1 = L1_1.matched
      if L1_1 then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[4]
        L1_1 = L1_1.utf8p2
        if L1_1 ~= nil then
          L1_1 = string
          L1_1 = L1_1.lower
          L2_1 = this_sigattrlog
          L2_1 = L2_1[4]
          L2_1 = L2_1.utf8p2
          L1_1 = L1_1(L2_1)
          L0_1 = L1_1
      end
      else
        L1_1 = this_sigattrlog
        L1_1 = L1_1[5]
        L1_1 = L1_1.matched
        if L1_1 then
          L1_1 = this_sigattrlog
          L1_1 = L1_1[5]
          L1_1 = L1_1.utf8p2
          if L1_1 ~= nil then
            L1_1 = string
            L1_1 = L1_1.lower
            L2_1 = this_sigattrlog
            L2_1 = L2_1[5]
            L2_1 = L2_1.utf8p2
            L1_1 = L1_1(L2_1)
            L0_1 = L1_1
        end
        else
          L1_1 = this_sigattrlog
          L1_1 = L1_1[6]
          L1_1 = L1_1.matched
          if L1_1 then
            L1_1 = this_sigattrlog
            L1_1 = L1_1[6]
            L1_1 = L1_1.utf8p2
            if L1_1 ~= nil then
              L1_1 = string
              L1_1 = L1_1.lower
              L2_1 = this_sigattrlog
              L2_1 = L2_1[6]
              L2_1 = L2_1.utf8p2
              L1_1 = L1_1(L2_1)
              L0_1 = L1_1
          end
          else
            L1_1 = this_sigattrlog
            L1_1 = L1_1[7]
            L1_1 = L1_1.matched
            if L1_1 then
              L1_1 = this_sigattrlog
              L1_1 = L1_1[7]
              L1_1 = L1_1.utf8p2
              if L1_1 ~= nil then
                L1_1 = string
                L1_1 = L1_1.lower
                L2_1 = this_sigattrlog
                L2_1 = L2_1[7]
                L2_1 = L2_1.utf8p2
                L1_1 = L1_1(L2_1)
                L0_1 = L1_1
            end
            else
              L1_1 = this_sigattrlog
              L1_1 = L1_1[8]
              L1_1 = L1_1.matched
              if L1_1 then
                L1_1 = this_sigattrlog
                L1_1 = L1_1[8]
                L1_1 = L1_1.utf8p2
                if L1_1 ~= nil then
                  L1_1 = string
                  L1_1 = L1_1.lower
                  L2_1 = this_sigattrlog
                  L2_1 = L2_1[8]
                  L2_1 = L2_1.utf8p2
                  L1_1 = L1_1(L2_1)
                  L0_1 = L1_1
                end
              end
            end
          end
        end
      end
    end
  end
end
if L0_1 == nil or L0_1 == "" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = {}
L2_1 = " /etc/sudoers"
L3_1 = " /etc/shadow"
L4_1 = " /etc/passwd"
L5_1 = " /etc/ld.so.preload"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L2_1 = ipairs
L3_1 = L1_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L8_1 = L0_1
  L7_1 = L0_1.sub
  L9_1 = #L6_1
  L9_1 = -1 * L9_1
  L7_1 = L7_1(L8_1, L9_1)
  if L7_1 == L6_1 then
    L7_1 = reportRelatedBmHits
    L7_1()
    L7_1 = addRelatedProcess
    L7_1()
    L7_1 = mp
    L7_1 = L7_1.INFECTED
    return L7_1
  end
end
L2_1 = {}
L3_1 = " /etc/sudoers "
L4_1 = " /etc/shadow "
L5_1 = " /etc/passwd "
L6_1 = " /etc/ld.so.preload "
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L2_1[4] = L6_1
L3_1 = ipairs
L4_1 = L2_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L8_1 = string
  L8_1 = L8_1.find
  L9_1 = L0_1
  L10_1 = L7_1
  L11_1 = 1
  L12_1 = true
  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  if L8_1 then
    L8_1 = reportRelatedBmHits
    L8_1()
    L8_1 = addRelatedProcess
    L8_1()
    L8_1 = mp
    L8_1 = L8_1.INFECTED
    return L8_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
