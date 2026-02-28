local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 == L1_1 then
    goto lbl_15
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_15::
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FNAME
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_PATH
L3_1 = L3_1(L4_1, L5_1)
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L2_1(L3_1, L4_1)
L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
if L2_1 == nil or L2_1 == "" or L1_1 == nil or L1_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.find
L4_1 = L1_1
L5_1 = "/bin"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 ~= 1 then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L1_1
  L5_1 = "/system"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 ~= 1 then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L1_1
    L5_1 = "/library/apple/"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 ~= 1 then
      L3_1 = string
      L3_1 = L3_1.find
      L4_1 = L1_1
      L5_1 = "/library/installersandboxes/"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if L3_1 ~= 1 then
        L3_1 = string
        L3_1 = L3_1.find
        L4_1 = L1_1
        L5_1 = "/library/systemextensions/"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if L3_1 ~= 1 then
          L3_1 = string
          L3_1 = L3_1.find
          L4_1 = L1_1
          L5_1 = "/.git/modules/"
          L6_1 = 1
          L7_1 = true
          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
          if not L3_1 then
            L3_1 = string
            L3_1 = L3_1.find
            L4_1 = L1_1
            L5_1 = "/.git/hooks/"
            L6_1 = 1
            L7_1 = true
            L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
            if not L3_1 then
              L3_1 = string
              L3_1 = L3_1.find
              L4_1 = L1_1
              L5_1 = "/sbin"
              L6_1 = 1
              L7_1 = true
              L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
              if L3_1 ~= 1 then
                L3_1 = string
                L3_1 = L3_1.find
                L4_1 = L1_1
                L5_1 = "/private/var/db/com.apple.xpc.roleaccountd.staging"
                L6_1 = 1
                L7_1 = true
                L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                if L3_1 ~= 1 then
                  L3_1 = string
                  L3_1 = L3_1.find
                  L4_1 = L1_1
                  L5_1 = "/private/var/folders/"
                  L6_1 = 1
                  L7_1 = true
                  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                  if L3_1 ~= 1 then
                    L3_1 = string
                    L3_1 = L3_1.find
                    L4_1 = L1_1
                    L5_1 = "/usr/"
                    L6_1 = 1
                    L7_1 = true
                    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                    if L3_1 == 1 then
                      L3_1 = string
                      L3_1 = L3_1.find
                      L4_1 = L1_1
                      L5_1 = "/usr/local/"
                      L6_1 = 1
                      L7_1 = true
                      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                      L3_1 = not L3_1
                      if L3_1 == 1 then
                        goto lbl_159
                      end
                    end
                    L3_1 = string
                    L3_1 = L3_1.find
                    L4_1 = L1_1
                    L5_1 = "/applications/microsoft defender.app/"
                    L6_1 = 1
                    L7_1 = true
                    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                    if L3_1 ~= 1 then
                      goto lbl_162
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
::lbl_159::
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_162::
L3_1 = mp
L3_1 = L3_1.IsTrustedFile
L4_1 = false
L3_1 = L3_1(L4_1)
if L3_1 == true then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = macos
L3_1 = L3_1.GetDownloadUrl
L3_1 = L3_1()
if L3_1 == "" or L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.find
L5_1 = L3_1
L6_1 = "torrent"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if not L4_1 then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L3_1
  L6_1 = "piratebay"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L3_1
    L6_1 = "github."
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if not L4_1 then
      goto lbl_211
    end
  end
end
L4_1 = mp
L4_1 = L4_1.INFECTED
do return L4_1 end
::lbl_211::
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
