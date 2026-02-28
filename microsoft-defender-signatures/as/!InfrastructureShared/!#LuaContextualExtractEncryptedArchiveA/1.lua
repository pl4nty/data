local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = mp
L0_1 = L0_1.IsHipsRuleEnabled
L1_1 = "be9ba2d9-53ea-4cdc-84e5-9b1eeee46550"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_NEWLYCREATEDHINT
L0_1 = L0_1(L1_1)
if L0_1 ~= true then
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
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L1_1(L2_1, L3_1)
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
L2_1 = string
L2_1 = L2_1.len
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if not (L2_1 < 4) then
  L2_1 = string
  L2_1 = L2_1.len
  L3_1 = L0_1
  L2_1 = L2_1(L3_1)
  if not (L2_1 < 20) then
    goto lbl_62
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_62::
L2_1 = string
L2_1 = L2_1.sub
L3_1 = L1_1
L4_1 = -4
L2_1 = L2_1(L3_1, L4_1)
L3_1 = L2_1
L2_1 = L2_1.match
L4_1 = "%.(%w+)$"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = IsSuspiciousFileExt
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = "|winzip.exe|winzip64.exe|winrar.exe|rar.exe|7zfm.exe|7z.exe|"
L4_1 = string
L4_1 = L4_1.lower
L5_1 = mp
L5_1 = L5_1.get_contextdata
L6_1 = mp
L6_1 = L6_1.CONTEXT_DATA_PROCESSNAME
L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L5_1(L6_1)
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
L6_1 = L3_1
L5_1 = L3_1.find
L7_1 = "|"
L8_1 = L4_1
L9_1 = "|"
L7_1 = L7_1 .. L8_1 .. L9_1
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = L4_1
L6_1 = "[\"/&%%%*%-%w%s]* \"(.-)\""
L5_1 = L5_1 .. L6_1
L6_1 = mp
L6_1 = L6_1.get_contextdata
L7_1 = mp
L7_1 = L7_1.CONTEXT_DATA_PROCESS_PPID
L6_1 = L6_1(L7_1)
L7_1 = mp
L7_1 = L7_1.GetProcessCommandLine
L8_1 = L6_1
L7_1 = L7_1(L8_1)
if L7_1 == nil then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = string
L8_1 = L8_1.match
L10_1 = L7_1
L9_1 = L7_1.lower
L9_1 = L9_1(L10_1)
L10_1 = L5_1
L8_1 = L8_1(L9_1, L10_1)
if L8_1 == nil then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = MpCommon
L9_1 = L9_1.QueryPersistContext
L10_1 = L8_1
L11_1 = "ContextualDropEncryptedArchiveByEmail"
L9_1 = L9_1(L10_1, L11_1)
if not L9_1 then
  L10_1 = L8_1
  L9_1 = L8_1.find
  L11_1 = "\\temporary internet files\\content.outlook\\"
  L12_1 = 1
  L13_1 = true
  L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
  if not L9_1 then
    L10_1 = L8_1
    L9_1 = L8_1.find
    L11_1 = "\\inetcache\\content.outlook\\"
    L12_1 = 1
    L13_1 = true
    L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
    if not L9_1 then
      goto lbl_183
    end
  end
end
L9_1 = mp
L9_1 = L9_1.set_mpattribute
L10_1 = "MpDisableCaching"
L9_1(L10_1)
L9_1 = "enghipscpy:blockaccess:be9ba2d9-53ea-4cdc-84e5-9b1eeee46550"
L10_1 = MpCommon
L10_1 = L10_1.QueryPersistContext
L11_1 = mp
L11_1 = L11_1.getfilename
L11_1 = L11_1()
L12_1 = L9_1
L10_1 = L10_1(L11_1, L12_1)
if not L10_1 then
  L10_1 = MpCommon
  L10_1 = L10_1.AppendPersistContext
  L11_1 = mp
  L11_1 = L11_1.getfilename
  L11_1 = L11_1()
  L12_1 = L9_1
  L13_1 = 0
  L10_1(L11_1, L12_1, L13_1)
end
L10_1 = mp
L10_1 = L10_1.SetHipsRule
L11_1 = "be9ba2d9-53ea-4cdc-84e5-9b1eeee46550"
L10_1(L11_1)
L10_1 = mp
L10_1 = L10_1.BLOCKACCESS
do return L10_1 end
::lbl_183::
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
