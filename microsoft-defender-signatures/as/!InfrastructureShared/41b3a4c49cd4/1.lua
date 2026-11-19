-- Threat: !InfrastructureShared
-- Name: 41b3a4c49cd4
-- Type: 21

if this_sigattrlog[2] and this_sigattrlog[2].matched then
  local l_0_0 = this_sigattrlog[2]
  local l_0_1 = l_0_0.utf8p1
  if not l_0_1 or l_0_1 == "" then
    return mp.CLEAN
  end
  local l_0_2 = l_0_1:match("[%a]:\\[^\"%>%s]*%.dll")
  if not l_0_2 then
    return mp.CLEAN
  end
  
  local function l_0_3(l_1_0)
    local l_1_1 = l_1_0:gsub("\\", "\\\\")
    l_1_1 = l_1_1:gsub("([%^%$%(%)%.%[%]%*%+%-%?])", "\\%1")
    return l_1_1
  end
  
  local l_0_4 = l_0_3(l_0_2)
  local l_0_5, l_0_6 = pcall(MpCommon.RollingQueueQueryKeyRegex, "RQ_RecentExecDropped_MultipleKey_30m", l_0_4)
  if not l_0_5 or not l_0_6 then
    return mp.CLEAN
  end
  local l_0_7 = l_0_6.value ~= nil and {l_0_6} or l_0_6
  for l_0_8, l_0_9 in ipairs(l_0_7) do
    local l_0_10 = l_0_9 and l_0_9.value or nil
    if l_0_10 and type(l_0_10) == "string" and l_0_10:find("UnsignedFile", 1, true) then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end
return mp.CLEAN
