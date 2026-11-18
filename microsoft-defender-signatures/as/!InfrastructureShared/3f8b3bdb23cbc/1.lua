-- Threat: !InfrastructureShared
-- Name: 3f8b3bdb23cbc
-- Type: 21
-- Includes: BMLuaLib

bm.DisableSignature()
local l_0_0, l_0_1
if this_sigattrlog[9].matched and this_sigattrlog[9].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[9].utf8p2
elseif this_sigattrlog[10].matched and this_sigattrlog[10].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[10].utf8p2
end
if contains(l_0_0, "io.memorystream") then
elseif contains(l_0_0, "%-[eE][ncodemaNCODEMA]*%s+", false) then
  l_0_1 = NormalizeCmdline("powershell", l_0_0)
  if contains(l_0_1, "io.memorystream") then
    l_0_0 = l_0_1
  end
else
  return mp.CLEAN
end
local l_0_2 = {
  "chocolatey",
  "Seek(0,0)",
  "MINIPLASMA_INCONCLUSIVE"
}
if contains(l_0_0, l_0_2) then
  return mp.CLEAN
end
local l_0_3
if l_0_0 ~= nil then
  l_0_3 = string.match(l_0_0:lower(), "%[convert%]%:%:frombase64string%(%'?\"?([a-z0-9/%+=]+)")
  if l_0_3 ~= nil and #l_0_3 < 30 then
    return mp.CLEAN
  end
end
if contains(l_0_0, "convert]::frombase64string(") and contains(l_0_0, "io.streamreader") and contains(l_0_0, "io.compression.gzipstream") and contains(l_0_0, "::decompress") and contains(l_0_0, "readtoend()") then
  return mp.INFECTED
end
return mp.CLEAN
