-- Threat: !InfrastructureShared
-- Name: 144b3f482dbc1
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
local l_0_2 = {
  "python.exe",
  "agentexecutor.exe"
}
local l_0_3, l_0_4 = bm.get_process_relationships()
for l_0_5, l_0_6 in ipairs(l_0_3) do
  if l_0_6.image_path ~= nil then
    local l_0_7 = mp.bitand(l_0_6.reason_ex, 1)
    if l_0_7 == 1 and contains(l_0_6.image_path, l_0_2) then
      return mp.CLEAN
    end
  end
end
if contains(l_0_0, "%-[eE][ncodemaNCODEMA]*%s+", false) then
  l_0_1 = NormalizeCmdline("powershell", l_0_0)
  if l_0_1 ~= nil then
    bm.add_related_string("proc_cmdline", l_0_1, bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end
return mp.CLEAN
