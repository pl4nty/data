local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 52428800 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FNAME
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_PATH
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L1_1(L2_1, L3_1)
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
if L1_1 == nil or L1_1 == "" or L0_1 == nil or L0_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_PROCESS_PPID
L2_1 = L2_1(L3_1)
L3_1 = L0_1
L4_1 = "/"
L5_1 = L1_1
L3_1 = L3_1 .. L4_1 .. L5_1
L4_1 = string
L4_1 = L4_1.find
L5_1 = L0_1
L6_1 = "/bin"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 ~= 1 then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L0_1
  L6_1 = "/.git/modules/"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L0_1
    L6_1 = "/.git/hooks/"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if not L4_1 then
      L4_1 = string
      L4_1 = L4_1.find
      L5_1 = L0_1
      L6_1 = "/sbin"
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if L4_1 ~= 1 then
        L4_1 = string
        L4_1 = L4_1.find
        L5_1 = L0_1
        L6_1 = "/private/var/db/com.apple.xpc.roleaccountd.staging"
        L7_1 = 1
        L8_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
        if L4_1 ~= 1 then
          L4_1 = string
          L4_1 = L4_1.find
          L5_1 = L0_1
          L6_1 = "/private/var/folders/"
          L7_1 = 1
          L8_1 = true
          L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
          if L4_1 ~= 1 then
            L4_1 = string
            L4_1 = L4_1.find
            L5_1 = L0_1
            L6_1 = "/usr/"
            L7_1 = 1
            L8_1 = true
            L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
            if L4_1 == 1 then
              L4_1 = string
              L4_1 = L4_1.find
              L5_1 = L0_1
              L6_1 = "/usr/local/"
              L7_1 = 1
              L8_1 = true
              L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
              L4_1 = not L4_1
              if L4_1 == 1 then
                goto lbl_126
              end
            end
            L4_1 = string
            L4_1 = L4_1.find
            L5_1 = L0_1
            L6_1 = "/applications/microsoft defender.app/"
            L7_1 = 1
            L8_1 = true
            L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
            if L4_1 ~= 1 then
              goto lbl_129
            end
          end
        end
      end
    end
  end
end
::lbl_126::
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_129::
if L2_1 then
  L4_1 = MpCommon
  L4_1 = L4_1.BmTriggerSig
  L5_1 = L2_1
  L6_1 = "BM_DefenseEvasion_EmbeddedPayload"
  L7_1 = L3_1
  L4_1(L5_1, L6_1, L7_1)
end
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
