local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = versioning
L0_1 = L0_1.GetOrgID
L0_1 = L0_1()
if L0_1 ~= nil and L0_1 ~= "" then
  L2_1 = L0_1
  L1_1 = L0_1.lower
  L1_1 = L1_1(L2_1)
  if L1_1 == "2d1d3ad2-ead9-4243-95a6-8897fcc65ea7" then
    goto lbl_15
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_15::
L1_1 = versioning
L1_1 = L1_1.GetMachineGuid
L1_1 = L1_1()
if L1_1 ~= nil and L1_1 ~= "" then
  L3_1 = L1_1
  L2_1 = L1_1.lower
  L2_1 = L2_1(L3_1)
  if L2_1 == "1a37f9af-a7a4-5748-99d2-71f05455226b" then
    goto lbl_29
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_29::
L2_1 = mp
L2_1 = L2_1.getfilename
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.bitor
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_FNAME
L6_1 = mp
L6_1 = L6_1.FILEPATH_QUERY_PATH
L4_1 = L4_1(L5_1, L6_1)
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L3_1(L4_1, L5_1)
L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
if L3_1 == nil or L3_1 == "" or L2_1 == nil or L2_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = L2_1
L5_1 = "/"
L2_1 = L4_1 .. L5_1
L4_1 = string
L4_1 = L4_1.find
L5_1 = L2_1
L6_1 = "/private/tmp/"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L3_1
  L6_1 = "foo"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L3_1
    L6_1 = "keylogger"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if not L4_1 then
      L4_1 = string
      L4_1 = L4_1.find
      L5_1 = L3_1
      L6_1 = "tastatur"
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if not L4_1 then
        L4_1 = string
        L4_1 = L4_1.find
        L5_1 = L3_1
        L6_1 = "reverseshell"
        L7_1 = 1
        L8_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
        if not L4_1 then
          L4_1 = string
          L4_1 = L4_1.find
          L5_1 = L3_1
          L6_1 = "shellcoder"
          L7_1 = 1
          L8_1 = true
          L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
          if not L4_1 then
            L4_1 = string
            L4_1 = L4_1.find
            L5_1 = L3_1
            L6_1 = "peterkl"
            L7_1 = 1
            L8_1 = true
            L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
            if not L4_1 then
              goto lbl_135
            end
          end
        end
      end
    end
  end
  L4_1 = mp
  L4_1 = L4_1.GetCertificateInfo
  L4_1 = L4_1()
  L5_1 = #L4_1
  if L5_1 < 1 or L4_1 == nil then
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
::lbl_135::
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
