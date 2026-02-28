local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1
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
L2_1 = "Lua:FnameAttr!.claude.json"
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
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1)
L2_1 = "ai_discovery_scan"
L3_1 = "ai_claude_json"
L4_1 = string
L4_1 = L4_1.lower
L5_1 = "ai_claude_json_"
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
L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1 = L8_1(L9_1, L10_1)
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1)
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
  L9_1 = L8_1.projects
  if L9_1 then
    goto lbl_84
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
do return L9_1 end
::lbl_84::
L9_1 = {}
L10_1 = pairs
L11_1 = L8_1.projects
if not L11_1 then
  L11_1 = {}
end
L10_1, L11_1, L12_1 = L10_1(L11_1)
for L13_1, L14_1 in L10_1, L11_1, L12_1 do
  L15_1 = {}
  L15_1.projectPath = L13_1
  L15_1.lastModel = nil
  L16_1 = {}
  L15_1.mcpServers = L16_1
  L16_1 = L14_1.enabledMcpjsonServers
  if not L16_1 then
    L16_1 = {}
  end
  L15_1.enabledMcpjsonServers = L16_1
  L16_1 = L14_1.disabledMcpjsonServers
  if not L16_1 then
    L16_1 = {}
  end
  L15_1.disabledMcpjsonServers = L16_1
  L16_1 = L14_1.disabledMcpServers
  if not L16_1 then
    L16_1 = {}
  end
  L15_1.disabledMcpServers = L16_1
  L16_1 = L14_1.lastModelUsage
  if L16_1 then
    L16_1 = pairs
    L17_1 = L14_1.lastModelUsage
    L16_1, L17_1, L18_1 = L16_1(L17_1)
    for L19_1, L20_1 in L16_1, L17_1, L18_1 do
      L15_1.lastModel = L19_1
      break
    end
  end
  L16_1 = L14_1.mcpServers
  if not L16_1 then
    L16_1 = L14_1.servers
    if not L16_1 then
      goto lbl_199
    end
  end
  L16_1 = L14_1.mcpServers
  if not L16_1 then
    L16_1 = L14_1.servers
  end
  L17_1 = pairs
  L18_1 = L16_1
  L17_1, L18_1, L19_1 = L17_1(L18_1)
  for L20_1, L21_1 in L17_1, L18_1, L19_1 do
    L22_1 = ""
    L23_1 = L21_1.type
    if L23_1 then
      L22_1 = L21_1.type
    else
      L23_1 = L21_1.transport
      if L23_1 then
        L22_1 = L21_1.transport
      else
        L23_1 = L21_1.url
        if L23_1 then
          L22_1 = "http"
        else
          L22_1 = "stdio"
        end
      end
    end
    L23_1 = {}
    L24_1 = L21_1.headers
    if L24_1 then
      L24_1 = pairs
      L25_1 = L21_1.headers
      L24_1, L25_1, L26_1 = L24_1(L25_1)
      for L27_1, L28_1 in L24_1, L25_1, L26_1 do
        if L27_1 ~= "Authorization" then
          L23_1[L27_1] = L28_1
        end
      end
    end
    L24_1 = {}
    L25_1 = L21_1.env
    if L25_1 then
      L25_1 = pairs
      L26_1 = L21_1.env
      L25_1, L26_1, L27_1 = L25_1(L26_1)
      for L28_1, L29_1 in L25_1, L26_1, L27_1 do
        if L28_1 ~= "API_KEY" then
          L24_1[L28_1] = L29_1
        end
      end
    end
    L25_1 = table
    L25_1 = L25_1.insert
    L26_1 = L15_1.mcpServers
    L27_1 = {}
    L27_1.name = L20_1
    L28_1 = L21_1.type
    L27_1.type = L28_1
    L28_1 = L21_1.url
    L27_1.url = L28_1
    L28_1 = L21_1.command
    L27_1.command = L28_1
    L28_1 = L21_1.args
    L27_1.args = L28_1
    L27_1.transport = L22_1
    L27_1.headers = L23_1
    L27_1.environment = L24_1
    L25_1(L26_1, L27_1)
  end
  ::lbl_199::
  L16_1 = table
  L16_1 = L16_1.insert
  L17_1 = L9_1
  L18_1 = L15_1
  L16_1(L17_1, L18_1)
end
L10_1 = isnull
L11_1 = L9_1
L10_1 = L10_1(L11_1)
if L10_1 then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
L10_1 = safeJsonSerialize
L11_1 = L9_1
L10_1 = L10_1(L11_1)
L11_1 = pcall
L12_1 = MpCommon
L12_1 = L12_1.RollingQueueQueryKVNamespaced
L13_1 = L3_1
L14_1 = L2_1
L11_1, L12_1 = L11_1(L12_1, L13_1, L14_1)
if L11_1 and L12_1 ~= nil then
  L13_1 = pairs
  L14_1 = L12_1
  L13_1, L14_1, L15_1 = L13_1(L14_1)
  for L16_1, L17_1 in L13_1, L14_1, L15_1 do
    if L16_1 == L4_1 and L17_1 == L10_1 then
      L18_1 = mp
      L18_1 = L18_1.CLEAN
      return L18_1
    end
  end
end
L13_1 = AppendToRollingQueueNamespaced
L14_1 = L3_1
L15_1 = L2_1
L16_1 = L4_1
L17_1 = L10_1
L18_1 = L5_1
L19_1 = 100
L13_1(L14_1, L15_1, L16_1, L17_1, L18_1, L19_1)
L13_1 = mp
L13_1 = L13_1.SetDetectionString
L14_1 = L10_1
L13_1(L14_1)
L13_1 = mp
L13_1 = L13_1.INFECTED
return L13_1
