local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = 0
L1_1 = ""
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L1_1 = L2_1.utf8p2
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
      L2_1 = this_sigattrlog
      L2_1 = L2_1[3]
      L1_1 = L2_1.utf8p2
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
        L2_1 = this_sigattrlog
        L2_1 = L2_1[4]
        L1_1 = L2_1.utf8p2
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
          L2_1 = this_sigattrlog
          L2_1 = L2_1[5]
          L1_1 = L2_1.utf8p2
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
            L2_1 = this_sigattrlog
            L2_1 = L2_1[6]
            L1_1 = L2_1.utf8p2
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
              L2_1 = this_sigattrlog
              L2_1 = L2_1[7]
              L1_1 = L2_1.utf8p2
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
                L2_1 = this_sigattrlog
                L2_1 = L2_1[8]
                L1_1 = L2_1.utf8p2
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
                  L2_1 = this_sigattrlog
                  L2_1 = L2_1[9]
                  L1_1 = L2_1.utf8p2
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
  L2_1 = string
  L2_1 = L2_1.match
  L3_1 = L1_1
  L4_1 = ".:\\.*\\"
  L2_1 = L2_1(L3_1, L4_1)
  L3_1 = {}
  L4_1 = "nss3.dll"
  L5_1 = "msvcp140.dll"
  L6_1 = "vcruntime140.dll"
  L7_1 = "mozglue.dll"
  L8_1 = "freebl3.dll"
  L9_1 = "softokn3.dll"
  L10_1 = "sqlite3.dll"
  L11_1 = "nssdbm3.dll"
  L3_1[1] = L4_1
  L3_1[2] = L5_1
  L3_1[3] = L6_1
  L3_1[4] = L7_1
  L3_1[5] = L8_1
  L3_1[6] = L9_1
  L3_1[7] = L10_1
  L3_1[8] = L11_1
  L4_1 = #L3_1
  L5_1 = ""
  L6_1 = 1
  L7_1 = L4_1
  L8_1 = 1
  for L9_1 = L6_1, L7_1, L8_1 do
    L10_1 = L2_1
    L11_1 = L3_1[L9_1]
    L5_1 = L10_1 .. L11_1
    L10_1 = sysio
    L10_1 = L10_1.IsFileExists
    L11_1 = L5_1
    L10_1 = L10_1(L11_1)
    if L10_1 then
      L0_1 = L0_1 + 1
    end
  end
end
if 5 < L0_1 then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
