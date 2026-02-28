local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 ~= L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "Lua:FnameAttr!openclaw.json"
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FULL
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1)
L2_1 = "ai_discovery_scan"
L3_1 = "ai_openclaw_json"
L4_1 = string
L4_1 = L4_1.lower
L5_1 = "ai_openclaw_json"
L6_1 = L1_1
L5_1 = L5_1 .. L6_1
L4_1 = L4_1(L5_1)
L5_1 = 86400
L6_1 = mp
L6_1 = L6_1.getfilesize
L6_1 = L6_1()
if 1024000 < L6_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.readprotection
L8_1 = false
L7_1(L8_1)
L7_1 = tostring
L8_1 = mp
L8_1 = L8_1.readfile
L9_1 = 0
L10_1 = L6_1
L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1 = L8_1(L9_1, L10_1)
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1)
L8_1 = mp
L8_1 = L8_1.readprotection
L9_1 = true
L8_1(L9_1)
if not L7_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = safeJsonDeserialize
L9_1 = L7_1
L8_1 = L8_1(L9_1)
if L8_1 then
  L9_1 = L8_1.agents
  if L9_1 then
    goto lbl_84
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
do return L9_1 end
::lbl_84::

function L9_1(A0_2, ...)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= "table" then
    L2_2 = nil
    return L2_2
  end
  L2_2 = A0_2
  L3_2 = ipairs
  L4_2 = {}
  L5_2, L6_2, L7_2, L8_2, L9_2 = ...
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L4_2[3] = L7_2
  L4_2[4] = L8_2
  L4_2[5] = L9_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = type
    L9_2 = L2_2
    L8_2 = L8_2(L9_2)
    if L8_2 == "table" then
      L8_2 = L2_2[L7_2]
      if L8_2 ~= nil then
        goto lbl_25
      end
    end
    L8_2 = nil
    do return L8_2 end
    ::lbl_25::
    L2_2 = L2_2[L7_2]
  end
  return L2_2
end

L10_1 = {}
L11_1 = L9_1
L12_1 = L8_1
L13_1 = "agents"
L14_1 = "defaults"
L15_1 = "workspace"
L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
L10_1.workspace = L11_1
L11_1 = L9_1
L12_1 = L8_1
L13_1 = "agents"
L14_1 = "defaults"
L15_1 = "model"
L16_1 = "primary"
L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1, L16_1)
L10_1.model_primary = L11_1
L11_1 = L9_1
L12_1 = L8_1
L13_1 = "agents"
L14_1 = "defaults"
L15_1 = "model"
L16_1 = "fallbacks"
L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1, L16_1)
L10_1.model_fallbacks = L11_1
L11_1 = L9_1
L12_1 = L8_1
L13_1 = "agents"
L14_1 = "defaults"
L15_1 = "models"
L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
L10_1.model_defaults = L11_1
L11_1 = L9_1
L12_1 = L8_1
L13_1 = "tools"
L14_1 = "allow"
L11_1 = L11_1(L12_1, L13_1, L14_1)
L10_1.tools_allow = L11_1
L11_1 = L9_1
L12_1 = L8_1
L13_1 = "tools"
L14_1 = "deny"
L11_1 = L11_1(L12_1, L13_1, L14_1)
L10_1.tools_deny = L11_1
L11_1 = L9_1
L12_1 = L8_1
L13_1 = "tools"
L14_1 = "elevated"
L11_1 = L11_1(L12_1, L13_1, L14_1)
L10_1.tools_elevated = L11_1
L11_1 = isnull
L12_1 = L10_1
L11_1 = L11_1(L12_1)
if L11_1 then
  L11_1 = mp
  L11_1 = L11_1.CLEAN
  return L11_1
end
L11_1 = safeJsonSerialize
L12_1 = L10_1
L11_1 = L11_1(L12_1)
L12_1 = pcall
L13_1 = MpCommon
L13_1 = L13_1.RollingQueueQueryKVNamespaced
L14_1 = L3_1
L15_1 = L2_1
L12_1, L13_1 = L12_1(L13_1, L14_1, L15_1)
if L12_1 and L13_1 ~= nil then
  L14_1 = pairs
  L15_1 = L13_1
  L14_1, L15_1, L16_1 = L14_1(L15_1)
  for L17_1, L18_1 in L14_1, L15_1, L16_1 do
    if L17_1 == L4_1 and L18_1 == L11_1 then
      L19_1 = mp
      L19_1 = L19_1.CLEAN
      return L19_1
    end
  end
end
L14_1 = AppendToRollingQueueNamespaced
L15_1 = L3_1
L16_1 = L2_1
L17_1 = L4_1
L18_1 = L11_1
L19_1 = L5_1
L20_1 = 100
L14_1(L15_1, L16_1, L17_1, L18_1, L19_1, L20_1)
L14_1 = mp
L14_1 = L14_1.SetDetectionString
L15_1 = L11_1
L14_1(L15_1)
L14_1 = mp
L14_1 = L14_1.INFECTED
return L14_1
