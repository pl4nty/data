-- Threat: !InfrastructureShared
-- Name: 59d7874315e8
-- Type: 21

if not (hstrlog[1].matched and (hstrlog[2].matched or hstrlog[3].matched)) or not hstrlog[4].matched and not hstrlog[5].matched then
  return mp.CLEAN
end
local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if type(l_0_1) ~= "string" or 32768 < #l_0_1 then
  return mp.CLEAN
end
local l_0_2, l_0_3 = pcall(MpCommon.CommandLineToArgv, l_0_1)
if not l_0_2 or type(l_0_3) ~= "table" or #l_0_3 < 4 then
  return mp.CLEAN
end
if string.match(string.lower(l_0_3[1]), "[^\\/]+$") ~= "msiexec.exe" then
  return mp.CLEAN
end
local l_0_4 = {
  ["\225\181\150"] = "p",
  ["\225\180\190"] = "p",
  ["\225\181\131"] = "a",
  ["\225\180\172"] = "a",
  ["\225\182\156"] = "c",
  ["\234\159\178"] = "c",
  ["\225\181\143"] = "k",
  ["\225\180\183"] = "k",
  ["\225\181\141"] = "g",
  ["\225\180\179"] = "g",
  ["\225\181\137"] = "e",
  ["\225\180\177"] = "e"
}

local function l_0_5(l_1_0)
  if not string.match(l_1_0, "^[/%-]") then
    return false
  end
  local l_1_1 = "package"
  local l_1_2 = 2
  local l_1_3 = 0
  for l_1_4 = 1, #l_1_1 do
    local l_1_5 = string.sub(l_1_0, l_1_2, l_1_2)
    if l_1_5 == "" then
      return false
    end
    local l_1_6 = string.lower(l_1_5)
    if string.byte(l_1_5) >= 128 then
      l_1_5 = string.sub(l_1_0, l_1_2, l_1_2 + 2)
      l_1_6 = l_0_4[l_1_5]
      l_1_3 = l_1_3 + 1
    end
    if l_1_6 ~= string.sub(l_1_1, l_1_4, l_1_4) then
      return false
    end
    l_1_2 = l_1_2 + #l_1_5
  end
  return l_1_2 == #l_1_0 + 1 and 2 <= l_1_3
end

local l_0_6 = false
local l_0_7 = false
for l_0_8 = 2, #l_0_3 do
  local l_0_9 = string.lower(l_0_3[l_0_8])
  if l_0_9 == "/quiet" or l_0_9 == "-quiet" or string.match(l_0_9, "^[/%-]q[nbrf]?[!+]?$") then
    l_0_6 = true
  end
  if l_0_8 < #l_0_3 and l_0_5(l_0_9) and string.match(string.lower(l_0_3[l_0_8 + 1]), "^https?:\\+[^\\/%s?#]") then
    l_0_7 = true
  end
end
if not l_0_6 or not l_0_7 then
  return mp.CLEAN
end
return mp.INFECTED
