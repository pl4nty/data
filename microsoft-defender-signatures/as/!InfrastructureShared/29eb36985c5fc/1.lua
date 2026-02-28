local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L0_1 = L1_1.utf8p1
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.utf8p1
    if L1_1 ~= nil then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[3]
      L0_1 = L1_1.utf8p1
  end
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[4]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[4]
      L1_1 = L1_1.utf8p1
      if L1_1 ~= nil then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[4]
        L0_1 = L1_1.utf8p1
    end
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[5]
      L1_1 = L1_1.matched
      if L1_1 then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[5]
        L1_1 = L1_1.utf8p1
        if L1_1 ~= nil then
          L1_1 = this_sigattrlog
          L1_1 = L1_1[5]
          L0_1 = L1_1.utf8p1
      end
      else
        L1_1 = this_sigattrlog
        L1_1 = L1_1[6]
        L1_1 = L1_1.matched
        if L1_1 then
          L1_1 = this_sigattrlog
          L1_1 = L1_1[6]
          L1_1 = L1_1.utf8p1
          if L1_1 ~= nil then
            L1_1 = this_sigattrlog
            L1_1 = L1_1[6]
            L0_1 = L1_1.utf8p1
        end
        else
          L1_1 = this_sigattrlog
          L1_1 = L1_1[7]
          L1_1 = L1_1.matched
          if L1_1 then
            L1_1 = this_sigattrlog
            L1_1 = L1_1[7]
            L1_1 = L1_1.utf8p1
            if L1_1 ~= nil then
              L1_1 = this_sigattrlog
              L1_1 = L1_1[7]
              L0_1 = L1_1.utf8p1
          end
          else
            L1_1 = this_sigattrlog
            L1_1 = L1_1[8]
            L1_1 = L1_1.matched
            if L1_1 then
              L1_1 = this_sigattrlog
              L1_1 = L1_1[8]
              L1_1 = L1_1.utf8p1
              if L1_1 ~= nil then
                L1_1 = this_sigattrlog
                L1_1 = L1_1[8]
                L0_1 = L1_1.utf8p1
            end
            else
              L1_1 = this_sigattrlog
              L1_1 = L1_1[9]
              L1_1 = L1_1.matched
              if L1_1 then
                L1_1 = this_sigattrlog
                L1_1 = L1_1[9]
                L1_1 = L1_1.utf8p1
                if L1_1 ~= nil then
                  L1_1 = this_sigattrlog
                  L1_1 = L1_1[9]
                  L0_1 = L1_1.utf8p1
              end
              else
                L1_1 = this_sigattrlog
                L1_1 = L1_1[10]
                L1_1 = L1_1.matched
                if L1_1 then
                  L1_1 = this_sigattrlog
                  L1_1 = L1_1[10]
                  L1_1 = L1_1.utf8p1
                  if L1_1 ~= nil then
                    L1_1 = this_sigattrlog
                    L1_1 = L1_1[10]
                    L0_1 = L1_1.utf8p1
                end
                else
                  L1_1 = this_sigattrlog
                  L1_1 = L1_1[11]
                  L1_1 = L1_1.matched
                  if L1_1 then
                    L1_1 = this_sigattrlog
                    L1_1 = L1_1[11]
                    L1_1 = L1_1.utf8p1
                    if L1_1 ~= nil then
                      L1_1 = this_sigattrlog
                      L1_1 = L1_1[11]
                      L0_1 = L1_1.utf8p1
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
if L0_1 then
  function L1_1(A0_2)
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
  
  function L2_1(A0_2)
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
  
  L3_1 = {}
  L3_1.SIG_CONTEXT = "BM"
  L3_1.CONTENT_SOURCE = "SUSAPD-A"
  L3_1.PROCESS_CONTEXT = "powershell.exe"
  L3_1.FILELESS = "true"
  L3_1.CMDLINE_URL = "true"
  L4_1 = L1_1
  L5_1 = L0_1
  L4_1 = L4_1(L5_1)
  L5_1 = ipairs
  L6_1 = L4_1
  L5_1, L6_1, L7_1 = L5_1(L6_1)
  for L8_1, L9_1 in L5_1, L6_1, L7_1 do
    L10_1 = L2_1
    L11_1 = L9_1
    L10_1 = L10_1(L11_1)
    L11_1 = ipairs
    L12_1 = L10_1
    L11_1, L12_1, L13_1 = L11_1(L12_1)
    for L14_1, L15_1 in L11_1, L12_1, L13_1 do
      L16_1 = string
      L16_1 = L16_1.match
      L17_1 = L15_1
      L18_1 = "^https?://"
      L16_1 = L16_1(L17_1, L18_1)
      if L16_1 then
        L16_1 = SafeGetUrlReputation
        L17_1 = {}
        L18_1 = L15_1
        L17_1[1] = L18_1
        L18_1 = L3_1
        L19_1 = false
        L20_1 = 3000
        L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
        L17_1 = L16_1.urls
        L17_1 = L17_1[L15_1]
        if L17_1 then
          L17_1 = L16_1.urls
          L17_1 = L17_1[L15_1]
          L17_1 = L17_1.determination
          if L17_1 == 2 then
            L17_1 = L16_1.urls
            L17_1 = L17_1[L15_1]
            L17_1 = L17_1.confidence
            if 60 <= L17_1 then
              L17_1 = mp
              L17_1 = L17_1.INFECTED
              return L17_1
            end
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
