-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3f8b327ed16ea\1_luac 

-- params : ...
-- function num : 0
(bm.DisableSignature)()
local l_0_0, l_0_1 = nil, nil
if (this_sigattrlog[9]).matched and (this_sigattrlog[9]).utf8p2 ~= nil then
  l_0_0 = (this_sigattrlog[9]).utf8p2
else
  if (this_sigattrlog[10]).matched and (this_sigattrlog[10]).utf8p2 ~= nil then
    l_0_0 = (this_sigattrlog[10]).utf8p2
  end
end
if not contains(l_0_0, "io.memorystream") or contains(l_0_0, "%-[eE][ncodemaNCODEMA]*%s+", false) then
  l_0_1 = NormalizeCmdline("powershell", l_0_0)
  if contains(l_0_1, "io.memorystream") then
    l_0_0 = l_0_1
  end
else
  return mp.CLEAN
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC64: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC65: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC66: Overwrote pending register: R4 in 'AssignReg'

if ("chocolatey")("Seek(0,0)", l_0_2) then
  return mp.CLEAN
end
local l_0_3 = nil
if l_0_0 ~= nil then
  l_0_3 = (string.match)(l_0_0:lower(), "%[convert%]%:%:frombase64string%(%\'?\"?([a-z0-9/%+=]+)")
  if l_0_3 ~= nil and #l_0_3 < 30 then
    return mp.CLEAN
  end
end
if contains(l_0_0, "convert]::frombase64string(") and contains(l_0_0, "io.streamreader") and contains(l_0_0, "io.compression.gzipstream") and contains(l_0_0, "::decompress") and contains(l_0_0, "readtoend()") then
  return mp.INFECTED
end
return mp.CLEAN

