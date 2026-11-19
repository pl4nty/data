-- Threat: !InfrastructureShared
-- Name: b7b338595ae6
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if bm.GetSignatureMatchDuration() > 30000000 then
  return mp.CLEAN
end
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if #l_0_0 < 70 then
  return mp.CLEAN
end
l_0_0 = l_0_0:sub(1, -2)

local function l_0_1(l_1_0, l_1_1)
  local l_1_2 = {}
  for l_1_3 = 1, #l_1_1 do
    l_1_2[l_1_1[l_1_3]] = true
  end
  local l_1_4 = 0
  for l_1_5 = 1, #l_1_0 do
    if l_1_2[l_1_0[l_1_5]] then
      l_1_4 = l_1_4 + 1
    end
  end
  return l_1_4
end

local l_0_2, l_0_3 = bm.get_process_relationships()
for l_0_4, l_0_5 in ipairs(l_0_3) do
  local l_0_6 = mp.bitand(l_0_5.reason_ex, bm.RELATIONSHIP_CREATED)
  if l_0_6 == bm.RELATIONSHIP_CREATED then
    local l_0_7 = l_0_5.cmd_line
    local l_0_8 = l_0_5.ppid or ""
    local l_0_9, l_0_10 = pcall(MpCommon.CommandLineToArgv, l_0_7)
    local l_0_11, l_0_12 = pcall(MpCommon.CommandLineToArgv, l_0_0)
    if not l_0_9 or isnull(l_0_10) or type(l_0_10) ~= "table" or isnull(#l_0_10) then
      return mp.CLEAN
    end
    if not l_0_11 or isnull(l_0_12) or type(l_0_12) ~= "table" or isnull(#l_0_12) then
      return mp.CLEAN
    end
    if #l_0_10 == 1 or l_0_10[1] == nil then
      return mp.CLEAN
    end
    if #l_0_12 == 1 or l_0_12[1] == nil then
      return mp.CLEAN
    end
    if #l_0_12 ~= #l_0_10 then
      return mp.CLEAN
    end
    bm.add_related_string("RegRunMRU", tostring(l_0_0), bm.RelatedStringBMReport)
    local l_0_13 = l_0_1(l_0_12, l_0_10)
    if l_0_13 ~= #l_0_10 - 1 then
      return mp.CLEAN
    end
    if l_0_8 then
      bm.trigger_sig_target_propagate("ProcRunMRU", l_0_7, l_0_8)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
