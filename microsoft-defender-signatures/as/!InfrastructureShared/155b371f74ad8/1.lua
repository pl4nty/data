-- Threat: !InfrastructureShared
-- Name: 155b371f74ad8
-- Type: 21

local l_0_0
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[6].utf8p2)
elseif this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[7].utf8p2)
else
  return mp.CLEAN
end
local l_0_1 = bm.get_current_process_startup_info()
if l_0_1 == nil or l_0_1.command_line == nil then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1.command_line)
if MpCommon.GetPersistContextCountNoPath("SuspScriptPersist") > 0 then
  local l_0_3 = MpCommon.GetPersistContextNoPath("SuspScriptPersist")
  if l_0_3 then
    for l_0_4, l_0_5 in ipairs(l_0_3) do
      local l_0_6 = string.match(l_0_5, "\\([^\\]+)$")
      if l_0_6 ~= nil and string.find(l_0_2, l_0_6, 1, true) and string.find(l_0_0, l_0_6, 1, true) then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
