local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1
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
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end

function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = {}
  L2_2 = string
  L2_2 = L2_2.gmatch
  L3_2 = A0_2
  L4_2 = "[^%s]+"
  L2_2, L3_2, L4_2 = L2_2(L3_2, L4_2)
  for L5_2 in L2_2, L3_2, L4_2 do
    L6_2 = table
    L6_2 = L6_2.insert
    L7_2 = L1_2
    L8_2 = L5_2
    L6_2(L7_2, L8_2)
  end
  L2_2 = nil
  L3_2 = 1
  L4_2 = #L1_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = L1_2[L6_2]
    if L7_2 == "/xml" then
      L7_2 = L6_2 + 1
      L7_2 = L1_2[L7_2]
      if L7_2 ~= nil then
        L7_2 = L6_2 + 1
        L2_2 = L1_2[L7_2]
        L7_2 = string
        L7_2 = L7_2.gsub
        L8_2 = L2_2
        L9_2 = "^%s*(.-)%s*$"
        L10_2 = "%1"
        L7_2 = L7_2(L8_2, L9_2, L10_2)
        L2_2 = L7_2
        L7_2 = string
        L7_2 = L7_2.gsub
        L8_2 = L2_2
        L9_2 = "^['\"]*(.-)['\"]*$"
        L10_2 = "%1"
        L7_2 = L7_2(L8_2, L9_2, L10_2)
        L2_2 = L7_2
      end
      break
    end
  end
  return L2_2
end

L2_1 = L1_1
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L3_1 = {}
L4_1 = "\\users\\.+"
L5_1 = "\\device\\cdrom.+"
L6_1 = "\\device\\mup\\.+"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L4_1 = ipairs
L5_1 = L3_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L9_1 = string
  L9_1 = L9_1.find
  L10_1 = L2_1
  L11_1 = L8_1
  L9_1 = L9_1(L10_1, L11_1)
  if L9_1 then
    function L9_1(A0_2)
      local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
      
      L1_2 = {}
      L2_2 = {}
      L3_2 = false
      L5_2 = A0_2
      L4_2 = A0_2.gsub
      L6_2 = "<!%-%-(.-)%-%->"
      L7_2 = ""
      L4_2 = L4_2(L5_2, L6_2, L7_2)
      A0_2 = L4_2
      L5_2 = A0_2
      L4_2 = A0_2.gsub
      L6_2 = "<%?(.-)%?>"
      L7_2 = ""
      L4_2 = L4_2(L5_2, L6_2, L7_2)
      A0_2 = L4_2
      L5_2 = A0_2
      L4_2 = A0_2.gsub
      L6_2 = "<([/!]?)([%a_][%w-:_]*)%s*(/?>?)([^<]*)"
      
      function L7_2(A0_3, A1_3, A2_3, A3_3)
        local L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3
        L4_3 = #A0_3
        if L4_3 == 0 then
          L4_3 = {}
          L5_3 = #A2_3
          if L5_3 == 0 then
            L5_3 = 0
            L6_3 = string
            L6_3 = L6_3.gmatch
            L7_3 = A3_3
            L8_3 = "(([%a_][%w-:_]*)%s*=%s*(['\"])(.-)%3%s*(/?>?))"
            L6_3, L7_3, L8_3 = L6_3(L7_3, L8_3)
            for L9_3, L10_3, L11_3, L12_3, L13_3 in L6_3, L7_3, L8_3 do
              L14_3 = #L9_3
              L5_3 = L5_3 + L14_3
              L4_3[L10_3] = L12_3
              L14_3 = #L13_3
              if L14_3 ~= 0 then
                if L13_3 == "/>" then
                  A3_3 = ""
                elseif L13_3 == ">" then
                  L15_3 = A3_3
                  L14_3 = A3_3.sub
                  L16_3 = L5_3 + 1
                  L14_3 = L14_3(L15_3, L16_3)
                  A3_3 = L14_3
                else
                  L14_3 = error
                  L15_3 = "invalid tag"
                  L14_3(L15_3)
                end
                A2_3 = L13_3
              end
            end
          end
          L5_3 = table
          L5_3 = L5_3.insert
          L6_3 = L1_2
          L7_3 = A1_3
          L5_3(L6_3, L7_3)
          L5_3 = L3_2
          if not L5_3 and A1_3 == "Command" then
            L5_3 = true
            L3_2 = L5_3
          end
          L5_3 = L3_2
          if L5_3 and A3_3 ~= "" then
            L5_3 = table
            L5_3 = L5_3.insert
            L6_3 = L2_2
            L7_3 = A3_3
            L5_3(L6_3, L7_3)
          end
          L5_3 = next
          L6_3 = L4_3
          L5_3 = L5_3(L6_3)
          if not L5_3 then
            L4_3 = nil
          end
          L6_3 = A2_3
          L5_3 = A2_3.byte
          L7_3 = 1
          L5_3 = L5_3(L6_3, L7_3)
          L6_3 = string
          L6_3 = L6_3.byte
          L7_3 = "/"
          L6_3 = L6_3(L7_3)
          if L5_3 == L6_3 then
            L5_3 = table
            L5_3 = L5_3.remove
            L6_3 = L1_2
            L5_3(L6_3)
          end
        elseif A0_3 == "/" then
          L4_3 = L1_2
          L5_3 = L1_2
          L5_3 = #L5_3
          L4_3 = L4_3[L5_3]
          if L4_3 == A1_3 then
            L4_3 = table
            L4_3 = L4_3.remove
            L5_3 = L1_2
            L4_3(L5_3)
          else
            L4_3 = error
            L5_3 = "invalid XML: mismatch closing tag"
            L4_3(L5_3)
          end
          L4_3 = L3_2
          if L4_3 and A1_3 == "Command" then
            L4_3 = false
            L3_2 = L4_3
          end
        elseif A0_3 == "!" then
          L4_3 = error
          L5_3 = "unsupported tag type"
          L4_3(L5_3)
        else
          L4_3 = error
          L5_3 = "parsing error"
          L4_3(L5_3)
        end
      end
      
      L4_2(L5_2, L6_2, L7_2)
      return L2_2
    end
    
    L10_1 = sysio
    L10_1 = L10_1.GetFileSize
    L11_1 = L2_1
    L10_1 = L10_1(L11_1)
    if 50000 < L10_1 then
      L11_1 = mp
      L11_1 = L11_1.CLEAN
      return L11_1
    end
    L11_1 = tostring
    L12_1 = sysio
    L12_1 = L12_1.ReadFile
    L13_1 = L2_1
    L14_1 = 0
    L15_1 = L10_1
    L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1 = L12_1(L13_1, L14_1, L15_1)
    L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1)
    L12_1 = L9_1
    L13_1 = L11_1
    L12_1 = L12_1(L13_1)
    
    function L13_1(A0_2)
      local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
      L1_2 = {}
      L2_2 = string
      L2_2 = L2_2.gmatch
      L3_2 = A0_2
      L4_2 = "http[s]?://[^\"%s]+"
      L2_2, L3_2, L4_2 = L2_2(L3_2, L4_2)
      for L5_2 in L2_2, L3_2, L4_2 do
        L6_2 = table
        L6_2 = L6_2.insert
        L7_2 = L1_2
        L8_2 = L5_2
        L6_2(L7_2, L8_2)
      end
      return L1_2
    end
    
    L14_1 = ipairs
    L15_1 = L12_1
    L14_1, L15_1, L16_1 = L14_1(L15_1)
    for L17_1, L18_1 in L14_1, L15_1, L16_1 do
      L19_1 = L13_1
      L20_1 = L18_1
      L19_1 = L19_1(L20_1)
      L20_1 = ipairs
      L21_1 = L19_1
      L20_1, L21_1, L22_1 = L20_1(L21_1)
      for L23_1, L24_1 in L20_1, L21_1, L22_1 do
        L25_1 = string
        L25_1 = L25_1.match
        L26_1 = L24_1
        L27_1 = "^https?://"
        L25_1 = L25_1(L26_1, L27_1)
        if L25_1 then
          L25_1 = mp
          L25_1 = L25_1.INFECTED
          return L25_1
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
