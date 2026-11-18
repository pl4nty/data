-- Threat: !InfrastructureShared
-- Name: a9b38ddf3a5f
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = versioning.GetOrgID()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = {
  ["64eacc49-6a31-42c6-9b39-c3d9148e65f4"] = true,
  ["0d5a49d5-57c7-40c0-ab8b-3a066e83b05a"] = true,
  ["313091c0-1f10-4d61-9655-068742b3534f"] = true
}
if not l_0_1[string.lower(l_0_0)] then
  return mp.CLEAN
end
local l_0_2, l_0_3 = pcall(GetRollingQueue, "evil_queue")
if not l_0_2 or isnull(l_0_3) then
  return mp.CLEAN
end
if not (this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1) or not this_sigattrlog[4].utf8p2 then
  return mp.CLEAN
end
local l_0_4 = this_sigattrlog[4].utf8p1
local l_0_5 = this_sigattrlog[4].utf8p2
if 500 <= #l_0_5 then
  local l_0_6 = string.lower(l_0_4)
  for l_0_7, l_0_8 in ipairs(l_0_3) do
    if string.find(l_0_6, tostring(l_0_8.key)) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
