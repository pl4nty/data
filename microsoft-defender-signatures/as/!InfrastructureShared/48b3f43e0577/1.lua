-- Threat: !InfrastructureShared
-- Name: 48b3f43e0577
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 == nil then
  return mp.CLEAN
end
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil and string.match(this_sigattrlog[1].utf8p1, "%.scr$") == nil then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(l_0_0, true, true) == true then
  return mp.CLEAN
end
local l_0_1 = {
  ["dat.client.exe"] = true,
  ["mysqlworkbench.exe"] = true,
  ["vida.desktop.exe"] = true,
  ["dragonfly.exe"] = true,
  ["xrmtoolbox.exe"] = true,
  ["java.exe"] = true,
  ["idea64.exe"] = true,
  ["eclipse-inst.exe"] = true,
  ["cosmosworker.exe"] = true,
  ["bt.saas.agentdesktop.exe"] = true,
  ["codemeterruntime.exe"] = true,
  ["aetherclientx.exe"] = true
}
local l_0_2 = string.lower(l_0_0:match("\\([^\\]+)$"))
if l_0_1[l_0_2] then
  return mp.CLEAN
end
return mp.INFECTED
