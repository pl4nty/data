-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:LNK/Obfuse.SA
-- Type: 13
-- MpAttributes: BM_LNK_FILE & (SCRIPT:CMDString | SCPT:LNK/http | SCPT:LNK/TempDir | SCPT:Exit)

local function l_0_0(l_1_0)
  local l_1_1 = 0
  
  if not l_1_0 then
    return l_1_1
  end
  for l_1_2 in l_1_0, nil, nil do
    l_1_1 = l_1_1 + 1
  end
  return l_1_1
end

local l_0_1
if not mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") then
  return mp.CLEAN
end
l_0_1 = tostring(headerpage)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = l_0_0(string.gmatch(l_0_1, "||"))
local l_0_3 = l_0_0(string.gmatch(l_0_1, "&"))
if 3 <= l_0_2 or 3 <= l_0_3 then
  return mp.INFECTED
end
return mp.CLEAN
