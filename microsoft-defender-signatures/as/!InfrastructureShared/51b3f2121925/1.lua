-- Threat: !InfrastructureShared
-- Name: 51b3f2121925
-- Type: 21

local l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if string.find(l_0_0, "net.webclient", 1, true) and string.find(l_0_0, "download", 1, true) and (string.match(l_0_0, "[^s]iex[^e]") or string.find(l_0_0, "invoke-expr", 1, true) or string.find(l_0_0, ".bat", 1, true) or string.find(l_0_0, ".ps1", 1, true)) then
  return mp.INFECTED
end
return mp.CLEAN
