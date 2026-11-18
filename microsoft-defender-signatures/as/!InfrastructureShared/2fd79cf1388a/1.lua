-- Threat: !InfrastructureShared
-- Name: 2fd79cf1388a
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil and l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.image_path)
if not l_0_1:find("\\explorer.exe") then
  return mp.CLEAN
end
local l_0_2 = mp.GetScannedPPID()
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = mp.GetProcessCommandLine(l_0_2)
if l_0_3 == "" or l_0_3 == nil or 300 < #l_0_3 then
  return mp.CLEAN
end
local l_0_4 = string.lower(l_0_3)
if l_0_4:find("robot", 1, true) or l_0_4:find("captcha", 1, true) then
  return mp.INFECTED
end

local function l_0_5(l_1_0)
  local l_1_1 = {
    ["\206\191"] = "o",
    ["\213\130"] = "o",
    ["\195\179"] = "o",
    ["\195\182"] = "o",
    ["\208\190"] = "o",
    ["\214\133"] = "o",
    ["\201\190"] = "r",
    ["\208\179"] = "r",
    ["\209\130"] = "t",
    ["\206\164"] = "T",
    ["\206\151"] = "H",
    ["\208\157"] = "H",
    ["\195\163"] = "a",
    ["\208\176"] = "a",
    ["\206\145"] = "A",
    ["\195\132"] = "A",
    ["\195\161"] = "a",
    ["\201\145"] = "a",
    ["\208\144"] = "A",
    ["\195\159"] = "b",
    ["\209\140"] = "b",
    ["\195\167"] = "c",
    ["\208\161"] = "C",
    ["\207\185"] = "C",
    ["\208\160"] = "P",
    ["\206\161"] = "P",
    ["\234\147\178"] = "I",
    ["\234\147\145"] = "p",
    ["\234\147\148"] = "T",
    ["\225\185\173"] = "t",
    ["\225\180\155"] = "t"
  }
  local l_1_2 = ""
  local l_1_3 = 1
  while l_1_3 <= #l_1_0 do
    local l_1_4 = l_1_0:sub(l_1_3, l_1_3 + 2)
    if l_1_1[l_1_4] then
      l_1_2 = l_1_2 .. l_1_1[l_1_4]
      l_1_3 = l_1_3 + #l_1_4
    else
      local l_1_5 = l_1_0:sub(l_1_3, l_1_3 + 1)
      if l_1_1[l_1_5] then
        l_1_2 = l_1_2 .. l_1_1[l_1_5]
        l_1_3 = l_1_3 + #l_1_5
      else
        l_1_2 = l_1_2 .. l_1_0:sub(l_1_3, l_1_3)
        l_1_3 = l_1_3 + 1
      end
    end
  end
  return l_1_2
end

local l_0_6 = l_0_5(l_0_3)
l_0_6 = string.lower(l_0_6)
if l_0_6:find("robot", 1, true) or l_0_6:find("captcha", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
