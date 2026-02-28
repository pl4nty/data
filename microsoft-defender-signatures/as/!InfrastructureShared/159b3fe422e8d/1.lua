local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L2_1 = "|.js|jse|vbs|vbe|"
L3_1 = {}
L3_1.SPAWNING_SCRIPT = 1
L3_1.COLORCPL_ABUSE = 2
L3_1.BITSADMIN_HTTP = 3
L4_1 = {}
L5_1 = L3_1.SPAWNING_SCRIPT

function L6_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = this_sigattrlog
  L0_2 = L0_2[1]
  L0_2 = L0_2.matched
  if L0_2 then
    L0_2 = this_sigattrlog
    L0_2 = L0_2[1]
    L0_2 = L0_2.utf8p2
    if L0_2 ~= nil then
      L0_2 = this_sigattrlog
      L0_2 = L0_2[1]
      L0_2 = L0_2.utf8p2
      L1_1 = L0_2
      L0_2 = mp
      L0_2 = L0_2.GetExecutablesFromCommandLine
      L1_2 = L1_1
      L0_2 = L0_2(L1_2)
      L1_2 = ipairs
      L2_2 = L0_2
      L1_2, L2_2, L3_2 = L1_2(L2_2)
      for L4_2, L5_2 in L1_2, L2_2, L3_2 do
        L6_2 = sysio
        L6_2 = L6_2.IsFileExists
        L7_2 = L5_2
        L6_2 = L6_2(L7_2)
        if L6_2 then
          L6_2 = string
          L6_2 = L6_2.lower
          L7_2 = string
          L7_2 = L7_2.sub
          L8_2 = L5_2
          L9_2 = -3
          L7_2, L8_2, L9_2, L10_2, L11_2 = L7_2(L8_2, L9_2)
          L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
          L7_2 = string
          L7_2 = L7_2.find
          L8_2 = L2_1
          L9_2 = L6_2
          L10_2 = 1
          L11_2 = true
          L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
          if L7_2 then
            L7_2 = L3_1
            L7_2 = L7_2.COLORCPL_ABUSE
            return L7_2
          end
        end
      end
  end
  else
    L0_2 = mp
    L0_2 = L0_2.CLEAN
    return L0_2
  end
end

L4_1[L5_1] = L6_1
L5_1 = L3_1.COLORCPL_ABUSE

function L6_1()
  local L0_2, L1_2
  L0_2 = this_sigattrlog
  L0_2 = L0_2[3]
  L0_2 = L0_2.matched
  if L0_2 then
    L0_2 = this_sigattrlog
    L0_2 = L0_2[3]
    L0_2 = L0_2.utf8p2
    if L0_2 ~= nil then
      goto lbl_21
    end
  end
  L0_2 = this_sigattrlog
  L0_2 = L0_2[4]
  L0_2 = L0_2.matched
  if L0_2 then
    L0_2 = this_sigattrlog
    L0_2 = L0_2[4]
    L0_2 = L0_2.utf8p2
    if L0_2 ~= nil then
      ::lbl_21::
      L0_2 = L3_1
      L0_2 = L0_2.BITSADMIN_HTTP
      return L0_2
  end
  else
    L0_2 = mp
    L0_2 = L0_2.CLEAN
    return L0_2
  end
end

L4_1[L5_1] = L6_1
L5_1 = L3_1.BITSADMIN_HTTP

function L6_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L0_2 = this_sigattrlog
  L0_2 = L0_2[5]
  L0_2 = L0_2.matched
  if L0_2 then
    L0_2 = this_sigattrlog
    L0_2 = L0_2[5]
    L0_2 = L0_2.utf8p2
    if L0_2 ~= nil then
      L0_2 = string
      L0_2 = L0_2.lower
      L1_2 = this_sigattrlog
      L1_2 = L1_2[5]
      L1_2 = L1_2.utf8p2
      L0_2 = L0_2(L1_2)
      L0_1 = L0_2
      
      function L0_2(A0_3)
        local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
        L1_3 = {}
        L2_3 = string
        L2_3 = L2_3.gmatch
        L3_3 = A0_3
        L4_3 = "http[s]?://[^\"%s]+"
        L2_3, L3_3, L4_3 = L2_3(L3_3, L4_3)
        for L5_3 in L2_3, L3_3, L4_3 do
          L6_3 = table
          L6_3 = L6_3.insert
          L7_3 = L1_3
          L8_3 = L5_3
          L6_3(L7_3, L8_3)
        end
        return L1_3
      end
      
      L1_2 = L0_1
      if L1_2 ~= nil then
        L1_2 = string
        L1_2 = L1_2.find
        L2_2 = L0_1
        L3_2 = "bitsadmin"
        L4_2 = 1
        L5_2 = true
        L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
        if L1_2 then
          L1_2 = L0_2
          L2_2 = L0_1
          L1_2 = L1_2(L2_2)
          L2_2 = {}
          L2_2.SIG_CONTEXT = "BM"
          L2_2.CONTENT_SOURCE = "COLORCPL_BITSADMIN_WSCRIPT"
          L2_2.PROCESS_CONTEXT = "bitsadmin.exe"
          L2_2.FILELESS = "true"
          L2_2.CMDLINE_URL = "true"
          L3_2 = ipairs
          L4_2 = L1_2
          L3_2, L4_2, L5_2 = L3_2(L4_2)
          for L6_2, L7_2 in L3_2, L4_2, L5_2 do
            L8_2 = string
            L8_2 = L8_2.match
            L9_2 = L7_2
            L10_2 = "^https?://"
            L8_2 = L8_2(L9_2, L10_2)
            if L8_2 then
              L8_2 = SafeGetUrlReputation
              L9_2 = {}
              L10_2 = L7_2
              L9_2[1] = L10_2
              L10_2 = L2_2
              L11_2 = false
              L12_2 = 3000
              L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
              L9_2 = L8_2.urls
              L9_2 = L9_2[L7_2]
              if L9_2 then
                L9_2 = L8_2.urls
                L9_2 = L9_2[L7_2]
                L9_2 = L9_2.determination
                if L9_2 ~= 1 then
                  L9_2 = L8_2.urls
                  L9_2 = L9_2[L7_2]
                  L9_2 = L9_2.confidence
                  if L9_2 ~= 90 then
                    L9_2 = mp
                    L9_2 = L9_2.INFECTED
                    return L9_2
                  end
                end
              end
            end
          end
        end
      end
  end
  else
    L0_2 = mp
    L0_2 = L0_2.CLEAN
    return L0_2
  end
end

L4_1[L5_1] = L6_1
L5_1 = L3_1.SPAWNING_SCRIPT
while true do
  L6_1 = L4_1[L5_1]
  L6_1 = L6_1()
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  if L6_1 == L7_1 then
    break
  end
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  if L6_1 == L7_1 then
    break
  end
  L5_1 = L6_1
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
