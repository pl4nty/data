local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L2_1 = versioning
L2_1 = L2_1.GetOrgID
L2_1 = L2_1()
if L2_1 ~= nil and L2_1 ~= "" then
  L4_1 = L2_1
  L3_1 = L2_1.lower
  L3_1 = L3_1(L4_1)
  if L3_1 == "19973957-59ce-41e6-b56b-815adf4e993a" then
    goto lbl_55
  end
  L4_1 = L2_1
  L3_1 = L2_1.lower
  L3_1 = L3_1(L4_1)
  if L3_1 == "0dde20f2-5621-4cfa-b3f5-b920800dd3b4" then
    goto lbl_55
  end
  L4_1 = L2_1
  L3_1 = L2_1.lower
  L3_1 = L3_1(L4_1)
  if L3_1 == "eae651fb-6b33-43bf-9f1b-5db8005d08c8" then
    goto lbl_55
  end
  L4_1 = L2_1
  L3_1 = L2_1.lower
  L3_1 = L3_1(L4_1)
  if L3_1 == "cbbbdbab-3a64-4985-8c50-73f760c0c1e8" then
    goto lbl_55
  end
  L4_1 = L2_1
  L3_1 = L2_1.lower
  L3_1 = L3_1(L4_1)
  if L3_1 == "a969413e-4834-4ade-8fac-e72c8644bad5" then
    goto lbl_55
  end
  L4_1 = L2_1
  L3_1 = L2_1.lower
  L3_1 = L3_1(L4_1)
  if L3_1 == "bc8263de-5f1d-4e3d-aa94-c57c016921e9" then
    goto lbl_55
  end
  L4_1 = L2_1
  L3_1 = L2_1.lower
  L3_1 = L3_1(L4_1)
  if L3_1 == "e7b4b5b5-cc27-4121-aabc-5efec589973d" then
    goto lbl_55
  end
  L4_1 = L2_1
  L3_1 = L2_1.lower
  L3_1 = L3_1(L4_1)
  if L3_1 == "9ff3ad62-771c-4e90-b459-128e2785ef42" then
    goto lbl_55
  end
  L4_1 = L2_1
  L3_1 = L2_1.lower
  L3_1 = L3_1(L4_1)
  if L3_1 == "dde274ce-9e7c-4295-ba15-509d02bd42cd" then
    goto lbl_55
  end
  L4_1 = L2_1
  L3_1 = L2_1.lower
  L3_1 = L3_1(L4_1)
  if L3_1 == "f7f68d47-e8c5-4553-a51e-dec472f31bfd" then
    goto lbl_55
  end
  L4_1 = L2_1
  L3_1 = L2_1.lower
  L3_1 = L3_1(L4_1)
  if L3_1 == "4ec5f50d-2073-4ecf-986c-0dcca43f933a" then
    goto lbl_55
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_55::
L3_1 = this_sigattrlog
L3_1 = L3_1[5]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[5]
  L3_1 = L3_1.utf8p2
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[5]
    L3_1 = L3_1.utf8p2
    if L3_1 ~= "" then
      goto lbl_73
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_73::
L3_1 = bm
L3_1 = L3_1.get_imagepath
L3_1 = L3_1()
L0_1 = L3_1
L3_1 = IsExcludedByImagePathMacOS
L4_1 = L0_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = bm
L3_1 = L3_1.get_current_process_startup_info
L3_1 = L3_1()
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = L3_1.command_line
L5_1 = IsExcludedByCmdlineMacOS
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = this_sigattrlog
L5_1 = L5_1[5]
L1_1 = L5_1.utf8p2
L5_1 = IsKeyValuePairInRollingQueue
L6_1 = "MAC_UNS_ADHOC_PATHS"
L7_1 = "unsigned_adhoc_items"
L8_1 = L0_1
L5_1 = L5_1(L6_1, L7_1, L8_1)
if L5_1 then
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L1_1
  L7_1 = "^/Users/[^/]+/Desktop/[^/]+$"
  L8_1 = 1
  L9_1 = false
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if not L5_1 then
    L5_1 = string
    L5_1 = L5_1.find
    L6_1 = L1_1
    L7_1 = "^/Users/[^/]+/Documents/[^/]+$"
    L8_1 = 1
    L9_1 = false
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if not L5_1 then
      L5_1 = string
      L5_1 = L5_1.find
      L6_1 = L1_1
      L7_1 = "^/Users/[^/]+/Downloads/[^/]+$"
      L8_1 = 1
      L9_1 = false
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if not L5_1 then
        L5_1 = string
        L5_1 = L5_1.find
        L6_1 = L1_1
        L7_1 = "^/private/tmp/[^/]+$"
        L8_1 = 1
        L9_1 = false
        L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
        if not L5_1 then
          L5_1 = string
          L5_1 = L5_1.find
          L6_1 = L1_1
          L7_1 = "^/Users/[^/]+/Desktop/[^/]+/[^/]+$"
          L8_1 = 1
          L9_1 = false
          L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
          if not L5_1 then
            L5_1 = string
            L5_1 = L5_1.find
            L6_1 = L1_1
            L7_1 = "^/Users/[^/]+/Documents/[^/]+/[^/]+$"
            L8_1 = 1
            L9_1 = false
            L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
            if not L5_1 then
              L5_1 = string
              L5_1 = L5_1.find
              L6_1 = L1_1
              L7_1 = "^/Users/[^/]+/Downloads/[^/]+/[^/]+$"
              L8_1 = 1
              L9_1 = false
              L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
              if not L5_1 then
                L5_1 = string
                L5_1 = L5_1.find
                L6_1 = L1_1
                L7_1 = "^/private/tmp/[^/]+/[^/]+$"
                L8_1 = 1
                L9_1 = false
                L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                if not L5_1 then
                  goto lbl_192
                end
              end
            end
          end
        end
      end
    end
  end
  L5_1 = bm
  L5_1 = L5_1.trigger_sig
  L6_1 = "BM_UnsignedProcCreatedUnsignedFile"
  L7_1 = L1_1
  L5_1(L6_1, L7_1)
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
::lbl_192::
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
