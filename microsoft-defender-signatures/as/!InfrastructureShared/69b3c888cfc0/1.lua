-- Threat: !InfrastructureShared
-- Name: 69b3c888cfc0
-- Type: 21

function string_starts(l_1_0, l_1_1)
  return string.sub(l_1_0, 1, string.len(l_1_1)) == l_1_1
end

local l_0_0 = string.lower(sigattr_head[1].utf8p1)
if not string_starts(l_0_0, string.lower(mp.ContextualExpandEnvironmentVariables("%appdata%"))) then
  return mp.CLEAN
end
local l_0_1 = {
  "win",
  "cmd",
  "disk",
  "dsk",
  "ms",
  "hp",
  "intel",
  "amd",
  "dll",
  "tcp",
  "udp"
}
local l_0_2 = {
  "process",
  "proc",
  "monitor",
  "mon",
  "sys",
  "host",
  "mgr",
  "update",
  "updater"
}
local l_0_3 = {
  "64.exe",
  "32.exe",
  ".exe"
}
local l_0_4 = #l_0_1
local l_0_5 = #l_0_2
local l_0_6 = #l_0_3
local l_0_7 = string.match(l_0_0, "([^\\]+)$")
for l_0_8 = 1, l_0_4 do
  if string_starts(l_0_7, l_0_1[l_0_8]) then
    for l_0_9 = 1, l_0_5 do
      if string_starts(string.sub(l_0_7, string.len(l_0_1[l_0_8]) + 1), l_0_2[l_0_9]) then
        for l_0_10 = 1, l_0_6 do
          if string.sub(l_0_7, string.len(l_0_1[l_0_8]) + string.len(l_0_2[l_0_9]) + 1) == l_0_3[l_0_10] then
            return mp.INFECTED
          end
        end
      end
    end
  end
end
return mp.CLEAN
