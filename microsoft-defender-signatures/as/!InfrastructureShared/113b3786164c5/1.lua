-- Threat: !InfrastructureShared
-- Name: 113b3786164c5
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
local l_0_1 = MpCommon.QuerySessionInformation(l_0_0.ppid, MpCommon.WTSUserName)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = ""
local l_0_3 = false
local l_0_4 = false
l_0_3, l_0_2 = pcall(MpCommon.GetUserAccountGroups, "", l_0_1)
if l_0_3 and l_0_2 then
  local l_0_5 = {
    ["Backup Operators"] = true,
    ["Print Operators"] = true,
    ["Server Operators"] = true,
    ["Account Operators"] = true
  }
  for l_0_6, l_0_7 in ipairs(l_0_2) do
    if l_0_5[l_0_7.Name] then
      l_0_4 = l_0_7.Name
      break
    end
  end
  if l_0_4 then
    local l_0_8 = scrubData(l_0_1)
    bm.add_related_string("HVAUserAccount", l_0_4 .. ":" .. l_0_8, bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end
return mp.CLEAN
