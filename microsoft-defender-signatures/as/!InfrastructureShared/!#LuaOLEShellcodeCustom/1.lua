-- Threat: !InfrastructureShared
-- Name: !#Lua:OLE.Shellcode.Custom
-- Type: 13
-- MpAttributes: SCRIPT:OLE.EquationCLSID | SCPT:OLE.Equation3.A

local l_0_0 = mp.getfilesize()
if not l_0_0 or 7000 < l_0_0 and l_0_0 < 16000 or 22000 < l_0_0 and l_0_0 < 1300000 or 1600000 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1
if 7000 < l_0_0 and l_0_0 < 22000 then
  l_0_1 = tostring(mp.readfile(0, 7000))
elseif 1300000 < l_0_0 and l_0_0 < 1600000 then
  l_0_1 = tostring(mp.readfile(0, 20000))
else
  l_0_1 = tostring(mp.readfile(0, l_0_0))
end
local l_0_2, l_0_3 = string.find(l_0_1, "\208\207\017\224\161\177\026\225", 1, true)
if not l_0_2 or not l_0_3 then
  l_0_2, l_0_3 = string.find(l_0_1, "[Ee][Qq][Uu][Aa][Tt][Ii][Oo][Nn].3")
  if not l_0_2 or not l_0_3 then
    return mp.CLEAN
  end
end
local l_0_4 = l_0_2
local l_0_5 = {
  [184] = 5,
  [187] = 5,
  [185] = 5,
  [186] = 5,
  [190] = 5,
  [191] = 5,
  [188] = 5,
  [189] = 5,
  [203] = 1
}
local l_0_6 = {
  [129] = 6,
  [27] = 6,
  [247] = 2,
  [46] = 5,
  [45] = 5,
  [53] = 5,
  [5] = 5,
  [37] = 5
}
local l_0_7 = {
  [139] = 2
}
if mp.get_mpattribute("SCRIPT:OLE.EquationCLSID") then
  l_0_2 = l_0_4 + 2048 + 14
elseif mp.get_mpattribute("SCPT:OLE.Equation3.A") then
  l_0_2 = l_0_4 + 33
else
  return mp.CLEAN
end

local function l_0_8(l_1_0, l_1_1)
  local l_1_2 = {
    38,
    78,
    102,
    230,
    270,
    11305
  }
  for l_1_3, l_1_4 in ipairs(l_1_2) do
    l_0_2 = l_1_0 + 2048 + l_1_4
    if l_0_2 < l_0_0 and l_0_5[l_1_1:byte(l_0_2)] then
      return l_0_2
    end
  end
  return nil
end

if not (l_0_0 > l_0_2) or not l_0_5[l_0_1:byte(l_0_2)] then
  l_0_2 = l_0_8(l_0_4, l_0_1)
  if not l_0_2 then
    return mp.CLEAN
  end
end
l_0_2 = l_0_2 + (l_0_5[l_0_1:byte(l_0_2)] or 0)
if not (l_0_0 > l_0_2) or not l_0_6[l_0_1:byte(l_0_2)] then
  l_0_2 = l_0_8(l_0_4, l_0_1)
  if not l_0_2 or not l_0_6[l_0_1:byte(l_0_2)] then
    return mp.CLEAN
  end
end
l_0_2 = l_0_2 + (l_0_6[l_0_1:byte(l_0_2)] or 0)
if not (l_0_0 > l_0_2) or not l_0_7[l_0_1:byte(l_0_2)] then
  return mp.CLEAN
end
if not (l_0_0 > l_0_2 + 3) or not l_0_7[l_0_1:byte(l_0_2 + 2)] and not l_0_7[l_0_1:byte(l_0_2 + 3)] then
  return mp.CLEAN
end
local l_0_9 = mp.getfilename()
if l_0_9 and (string.find(l_0_9, "->(Rtf", 1, true) ~= nil or string.find(l_0_9, "->xl/embeddings/oleObject", 1, true) ~= nil) then
  mp.set_mpattribute("Lua:OLE.ShellcodeInSuspiciousFile")
end
return mp.INFECTED
