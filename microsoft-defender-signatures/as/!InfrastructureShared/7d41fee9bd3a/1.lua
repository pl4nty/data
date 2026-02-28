local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L4_1 = this_sigattrlog
L4_1 = L4_1[1]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[1]
  L4_1 = L4_1.utf8p2
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[1]
    L0_1 = L4_1.utf8p1
    L4_1 = this_sigattrlog
    L4_1 = L4_1[1]
    L1_1 = L4_1.utf8p2
end
else
  L4_1 = this_sigattrlog
  L4_1 = L4_1[2]
  L4_1 = L4_1.matched
  if L4_1 then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[2]
    L4_1 = L4_1.utf8p2
    if L4_1 ~= nil then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[2]
      L0_1 = L4_1.utf8p1
      L4_1 = this_sigattrlog
      L4_1 = L4_1[2]
      L1_1 = L4_1.utf8p2
    end
  end
end
L4_1 = contains
L5_1 = L1_1
L6_1 = "/command/base64/"
L4_1 = L4_1(L5_1, L6_1)
if not L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.match
L5_1 = L1_1
L6_1 = "Command%/Base64%/(.*)\"?'?}"
L4_1 = L4_1(L5_1, L6_1)
L2_1 = L4_1
if L2_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = MpCommon
L4_1 = L4_1.Base64Decode
L5_1 = L2_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
if L3_1 ~= nil then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L3_1
  L6_1 = "curl"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L3_1
    L6_1 = "wget"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if not L4_1 then
      L4_1 = string
      L4_1 = L4_1.find
      L5_1 = L3_1
      L6_1 = "powershell"
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if not L4_1 then
        L4_1 = string
        L4_1 = L4_1.find
        L5_1 = L3_1
        L6_1 = "python"
        L7_1 = 1
        L8_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
        if not L4_1 then
          L4_1 = string
          L4_1 = L4_1.find
          L5_1 = L3_1
          L6_1 = "mshta"
          L7_1 = 1
          L8_1 = true
          L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
          if not L4_1 then
            L4_1 = string
            L4_1 = L4_1.find
            L5_1 = L3_1
            L6_1 = "certutil"
            L7_1 = 1
            L8_1 = true
            L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
            if not L4_1 then
              L4_1 = string
              L4_1 = L4_1.find
              L5_1 = L3_1
              L6_1 = "cmd"
              L7_1 = 1
              L8_1 = true
              L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
              if not L4_1 then
                goto lbl_153
              end
            end
          end
        end
      end
    end
  end
  L4_1 = {}
  L5_1 = "["
  L6_1 = L0_1
  L7_1 = "]"
  L5_1 = L5_1 .. L6_1 .. L7_1
  L6_1 = "["
  L7_1 = L1_1
  L8_1 = "]"
  L6_1 = L6_1 .. L7_1 .. L8_1
  L4_1[L5_1] = L6_1
  L5_1 = nri
  L5_1 = L5_1.AddTelemetry
  L6_1 = mp
  L6_1 = L6_1.bitor
  L7_1 = mp
  L7_1 = L7_1.bitor
  L8_1 = nri
  L8_1 = L8_1.Telemetry_HOSTNAME
  L9_1 = nri
  L9_1 = L9_1.Telemetry_PATH
  L7_1 = L7_1(L8_1, L9_1)
  L8_1 = nri
  L8_1 = L8_1.Telemetry_QUERY
  L6_1 = L6_1(L7_1, L8_1)
  L7_1 = L4_1
  L5_1(L6_1, L7_1)
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
::lbl_153::
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
