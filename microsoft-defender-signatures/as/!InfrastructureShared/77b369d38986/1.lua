-- Threat: !InfrastructureShared
-- Name: 77b369d38986
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = {
  [".js"] = true
}
local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_0)
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if string.len(l_0_4) > 3 and sysio.IsFileExists(l_0_4) then
    local l_0_5 = string.sub(l_0_4, -3)
    if l_0_1[l_0_5] then
      local l_0_6 = string.match(l_0_4, "%.zip\\(.+)")
      local l_0_7, l_0_8 = string.gsub(l_0_6, "\\", "")
      if l_0_8 <= 1 then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
